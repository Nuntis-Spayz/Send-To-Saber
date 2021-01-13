# Send-To-Saber
Command line application to send a file to Open-Core saber.

    Usage: sendtosaber [-h -v -i -l -s -erase-all] <filename.ext>
    -h --help       -- show this help
    -v --version    -- display version no.
    -i --info       -- read saber firmware version and serial no.
    -l --list       -- list all files on saber
    -s --silent     -- do not wait for a key at the end
    -erase-all      -- erase the serial flash
    <filename.ext>  -- send the named file

## Open-Saber Sound Toolkit
  The toolkit is a means to bundle the send-to-saber command line along with 
  sevaral batch files, the "sox" utility for converting sounds and the original 
  Open-Core Saber sound fonts and several OpenSource (Creative Commons) 
  sound fonts with a README with uploading instructions.

  sox is available under the GPL2.0 at
  http://sox.sourceforge.net/
  https://sourceforge.net/projects/sox/

## Lazarus IDE/Free Pascal
  https://www.lazarus-ide.org/index.php?page=downloads
  
  For 64bit Windows
  -- install the 64bit compiler and then 32bit cross compiler -- recommended approach
     "Menu/Run/Compile many modes" will then build both the 64 and 32 bit executables
  
  For 32bit Windows
  -- install the 32bit compiler, if you also want to build for 64-bit Windows add 
     the 64 bit cross compiler.

Once up and running, before you open the project you will have to use 
the online package manager, in the Lazarus IDE, to install the following packages

* Requires Package "Synapse 40.1" - for unit Synaser - serial port access
