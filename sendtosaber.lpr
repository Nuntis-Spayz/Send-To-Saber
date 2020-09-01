program sendtosaber;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp
  , crt, fileinfo, registry, Synaser
  , winpeimagereader {need this for reading exe info}
  //, elfreader {needed for reading ELF executables}
  //, machoreader {needed for reading MACH-O executables}
  ;

type

  { TSendToSaber }

  TSendToSaber = class(TCustomApplication)
  protected
    procedure DoRun; override;
  public
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;
    procedure WriteHelp; virtual;
    procedure WriteVersion(all: boolean); virtual;
    procedure WaitKey; virtual;
    function GetPorts() : TStringList;
    procedure doErase(port : String);
    procedure sendFile(port, fname : String);
    function VerifyPort(port:String):boolean;
  end;

{ TSendToSaber }

procedure TSendToSaber.DoRun;
var
  foundPorts : TStringList;
  usePort : String;
  i : Integer;
begin
  // quick check parameters
  { ErrorMsg:=CheckOptions('h', 'help');
  if ErrorMsg<>'' then begin
    ShowException(Exception.Create(ErrorMsg));
    Terminate;
    Exit;
  end;
  }

  // parse parameters
  if (ParamCount=0) or HasOption('h', 'help') then
  begin
    WriteHelp;
    if Not(HasOption('s', 'silent')) then
    begin
      writeln('');
      writeln('==PRESS ANY KEY TO FINISH==');
      WaitKey;
    end;
    Terminate;
    Exit;
  end;
  if HasOption('v', 'version') then
  begin
    WriteVersion(true);
    if Not(HasOption('s', 'silent')) then
    begin
      writeln('');
      writeln('==PRESS ANY KEY TO FINISH==');
      WaitKey;
    end;
    Terminate;
    Exit;
  end;
  WriteVersion(false);

  { add your program here }
  usePort:='';
  foundPorts:=getPorts();

  if foundPorts.Count=0 then
  begin
    writeln('No Saber Ports Found.');
  end
  else
  begin
    if foundPorts.Count=1 then
    begin
      writeln('Found 1 Saber Port: '+foundPorts.Strings[0]);
      writeLn('Verifying Port is a saber.');
    end
    else
    begin
      writeln('Found '+IntToStr(foundPorts.Count)+' Saber Ports.');
      writeln('Scanning Ports to find an Open-Core Saber.');
    end;
    writeln('');

     i := 0;
     while usePort.IsEmpty and (i < foundPorts.Count) do
     begin
       writeLn('Testing Port: '+foundPorts.Strings[i]);
       if VerifyPort(foundPorts.Strings[i]) then
       begin
         usePort:=foundPorts.Strings[i];
         writeLn('Port '+foundPorts.Strings[i]+' is a writable Open-Core Saber.');
       end
       else
       begin
         writeLn('Port '+foundPorts.Strings[i]+' not a writable Open-Core Saber');
       end;
       inc(i);
    end;
    foundPorts.Free;

    if Not(usePort.IsEmpty) then
    begin
      if HasOption('erase-all') then
      begin
        doErase(usePort);
      end
      else
      begin
       sendFile(usePort,ParamStr(ParamCount));
      end;
    end
    else
    begin
      writeln('No Writable Open-Core Sabers Found.');
      writeln('Connect an Open-Core Saber with Updated Firmware.');
    end;
  end;

  { possible press a key to terminate }
  if Not(HasOption('s', 'silent')) then
  begin
    writeln('');
    writeln('==END==');
    writeln('==PRESS ANY KEY TO FINISH==');
    WaitKey;
  end;

  // stop program loop
  Terminate;
end;

constructor TSendToSaber.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  StopOnException:=True;
end;

destructor TSendToSaber.Destroy;
begin
  inherited Destroy;
end;

procedure TSendToSaber.doErase(port : String);
var
  inp : String;
  inbyte : Byte;
  ser : TBlockSerial;
  counter : Integer;
begin
  ser:= TBlockSerial.Create;
  try
    ser.Connect(port.Trim([':',' ']));
    ser.config(115200, 8, 'N', SB1, False, False);

    writeln('Querying Saber');
    writeln('--------------');
    ser.SendString('V?'+#10);
    inp:= ser.RecvTerminated(500,#10);
    if Not(inp.IsEmpty) then writeLn(inp);

    ser.SendString('S?'+#10);
    inp:= ser.RecvTerminated(500,#10);
    if Not(inp.IsEmpty) then writeLn(inp);


    ser.SendString('WR?'+#10);
    inp:= ser.RecvTerminated(500,#10);
    if inp='OK, Write Ready' then
    begin
      ser.SendString('ERASE=ALL'+#10);
      inp:= ser.RecvTerminated(500,#10);
      writeLn(inp);

      counter:=0;
      inbyte := ser.RecvByte(5000);
      while (counter<5) and ((ser.LastError=Synaser.ErrTimeout) or (inbyte<65)) do
      begin
        inc(counter);
        if Not(ser.LastError=Synaser.ErrTimeout) then
        begin
          if inbyte=10 then
            writeLn('')
          else
            write(chr(inbyte));
          counter:=0
        end;
        inbyte := ser.RecvByte(5000);
      end;
      if Not(ser.LastError=Synaser.ErrTimeout) then
           write(chr(inbyte));
      if counter>=5 then
        writeLn('ERROR, Communication Timed out...');

      inp:= ser.RecvTerminated(500,#10);
      writeLn(inp);
      inp:= ser.RecvTerminated(500,#10);
      writeLn(inp);

    end
    else
    begin
      writeln('Saber Not Ready to Write File, aborting.');
    end;

    ser.CloseSocket;
  finally
    ser.free;
  end;

end;

procedure TSendToSaber.sendFile(port, fname : String);
var
  fullname, inp : String;
  ver : String;
  ser : TBlockSerial;
  datFile : File of Byte;
  rByte : Byte;
begin
  fullname:='';
  if FileExists(fname) then
    fullname:=fname
  else if FileExists(ExtractFilePath(ExeName)+fname) then
    fullname:=ExtractFilePath(ExeName)+fname;

  if fullname.IsEmpty then
  begin
    writeln('');
    writeln('File '+fname+' not found.');
    Exit;
  end;

  ser:= TBlockSerial.Create;
  try
    ser.Connect(port.Trim([':',' ']));
    ser.config(115200, 8, 'N', SB1, False, False);

    writeln('Querying Saber');
    writeln('--------------');
    ser.SendString('V?'+#10);
    //ser.Flush;
    ver:= ser.RecvTerminated(500,#10);
    if Not(ver.IsEmpty) then writeLn(ver);

    ser.SendString('S?'+#10);
    //ser.Flush;
    inp:= ser.RecvTerminated(500,#10);
    if Not(inp.IsEmpty) then writeLn(inp);


    ser.SendString('WR?'+#10);
    //ser.Flush;
    inp:= ser.RecvTerminated(500,#10);
    if (ver>'V=1.') and (inp='OK, Write Ready') then
    begin
      writeln(inp);
      writeln('Saber Ready to Write to Serial Fash');
      writeLn('');
      writeln('Sending: '+fullname+' to '+port);
      writeln('as Serial Flash Name: '+ExtractFileName(fullname));

      AssignFile(datFile, fullname);
      Reset(datFile);
      writeLn('Filesize is:'+IntToStr(FileSize(datFile)));
      ser.SendString('WR='+ExtractFileName(fullname)+','+IntToStr(FileSize(datFile))+#10);
      inp:= ser.RecvTerminated(2500,#10);
      writeLn(inp);
      if inp.StartsWith('OK, Write ') then
      begin
        While not eof(datfile) do
        begin
          read(datFile, rByte);
          ser.SendByte(rByte);
        end;
      end;
      inp:= ser.RecvTerminated(500,#10);
      writeLn(inp);

    end
    else
    begin
      writeln('Saber Not Ready to Write File, aborting.');
    end;

    ser.CloseSocket;
  finally
    ser.free;
  end;

end;

procedure TSendToSaber.WaitKey;
var
  inp : Char;
begin
  { clear any buffered keys }
  while(KeyPressed) do
  begin
    inp:=ReadKey;
    if(inp=#0) then
      inp:=ReadKey;
  end;
  while(Not(KeyPressed)) do
    Sleep(100);
end;

function TSendToSaber.GetPorts(): TStringList;
var
  Reg:TRegistry;
  rs, cs: String;
  ls : TStringList;
  i: Integer;
begin
 writeln('Searching for Saber Ports...');

  // code for all kinds of windows
 ls := TStringList.Create;
 Reg := TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   if Reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM') then
   begin
     for i:=0 to 99 do
     begin
       // both anima and opencore present as --> \Device\USBSER000
       rs:='\Device\USBSER' + InttoStr(I).PadLeft(3,'0');

       //Memo1.Append(rs);
       if (reg.ValueExists(rs))then
       begin
         cs:= reg.ReadString(rs);
         ls.AddText(cs);
         writeln(cs+' : '+rs);
       end;
     end;

   end;
   finally
     Reg.Free;
   end;
   GetPorts:=ls;
end;

procedure TSendToSaber.WriteVersion(all: boolean);
var
 FileVerInfo: TFileVersionInfo;
begin
  FileVerInfo:=TFileVersionInfo.Create(nil);
  try
    FileVerInfo.ReadFileInfo;
    writeln('');
    writeln(FileVerInfo.VersionStrings.Values['ProductName']);
    writeln('----------------');
    if all then
    begin
      writeln('Version: ',FileVerInfo.VersionStrings.Values['FileVersion']);
      writeln('Company: ',FileVerInfo.VersionStrings.Values['CompanyName']);
      writeln('Description: ',FileVerInfo.VersionStrings.Values['FileDescription']);
      writeln('Internal name: ',FileVerInfo.VersionStrings.Values['InternalName']);
      //writeln('Copyright: ',FileVerInfo.VersionStrings.Values['LegalCopyright']);
      writeln('Original filename: ',FileVerInfo.VersionStrings.Values['OriginalFilename']);
      //writeln('Product version: ',FileVerInfo.VersionStrings.Values['ProductVersion']);
    end;
  finally
    FileVerInfo.Free;
  end;
end;

function TSendToSaber.VerifyPort(port:String):boolean;
var
  inp : String;
  ser : TBlockSerial;
begin
  VerifyPort:=True;

  ser:= TBlockSerial.Create;
  try
    ser.Connect(port.Trim([':',' ']));
    ser.config(115200, 8, 'N', SB1, False, False);

    ser.SendString('V?'+#10);
    inp:= ser.RecvTerminated(500,#10);
    if inp.IsEmpty or (inp<'V=1.') then VerifyPort:=False;

    if VerifyPort then
    begin
      ser.SendString('S?'+#10);
      inp:= ser.RecvTerminated(500,#10);
      if inp.IsEmpty or Not(inp.StartsWith('S=')) then VerifyPort:=False;

      if VerifyPort then
      begin
        WriteLn('VerifyPort (11)');
        ser.SendString('WR?'+#10);
        inp:= ser.RecvTerminated(500,#10);
        if inp.IsEmpty or Not(inp.StartsWith('OK, Write ')) then VerifyPort:=False;
      end;
    end;
    ser.CloseSocket;
  finally
    ser.free;
  end;
end;
procedure TSendToSaber.WriteHelp;
var
 FileVerInfo: TFileVersionInfo;
begin
  FileVerInfo:=TFileVersionInfo.Create(nil);
  try
    FileVerInfo.ReadFileInfo;
    writeln('');
    writeln(FileVerInfo.VersionStrings.Values['ProductName']);
    writeln('----------------');
    writeln('Version: ',FileVerInfo.VersionStrings.Values['FileVersion']);
  finally
    FileVerInfo.Free;
  end;
  { add your help code here }
  writeln('');
  if ParamCount=0 then
  begin
    writeLn('No Parameters, minimum filename required.');
    writeln('');
  end;
  writeln('Usage: ', ExtractFileName(ExeName), ' [-h -v -s -erase-all] <filename.ext>');
  writeln('  -h --help       -- show this help');
  writeln('  -v --version    -- display version no.');
  writeln('  -s --silent     -- do not wait for a key at the end');
  writeln('  -erase-all      -- erase the serial flash');
  writeln('  <filename.ext>  -- send the named file');
end;

var
  Application: TSendToSaber;

{$R *.res}

begin
  Application:=TSendToSaber.Create(nil);
  Application.Title:='sendtosaber';
  Application.Run;
  Application.Free;
end.

