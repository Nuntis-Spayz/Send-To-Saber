# "Open-Saber-Sound-Toolkit"

## Read Me version.7

Unzip the 7zip archive in a sensible file location (My Document or desktop)
or on windows run the self-extracting archive "Open-Saber-Sound-Toolkit.exe"

The extracted files will all be in a folder "Open-Saber-Sound-Toolkit".

If you explore into the sub-folder Open-Saber-Sound-Toolkit/OpenCore_OEM
you will see all the original files and one command.
  - Windows : "sendtosaber-all-raw.cmd"
  - MAC OS  : "sendtosaber-all-raw-macos.command"

Running the sendtosaber-all-raw command will erase ALL of the 
sounds on the saber and then re-upload them this can take a considerable 
amount of time 15—20 minutes so do not run it until you are prepared to 
let the saber and computer do their work for this amount of time.

The other MongoX_<something> folders contain sample open-source 
sound fonts.

Running the command sox-convert-toRAW command 
  - Windows : "sox-convert-toRAW.cmd"
  - MAC OS  : "sox-convert-toRAW-macos.command"

will convert all the WAV files in that directory into the correct RAW 
format then you can run the sendtosaber-all-raw to upload them to the saber.

The latest firmwares allow you to use any filenames you want for the files, 
but you must then tell the saber which type of sound uses which filenames.

ie. You must send a list of filesnames for each type of sound.

In each of the Mong1_<something> folders there is also a switchtoXXXXSounds 
command that sends to the saber the lists of which files are used for each
type of sound.

Sending lists of filenames means you can have any (up to 25) files for each 
sound type (including on, off and hum).

Also, because you cansend any filenames to the saber, if you remove the 
erase-all command from the send to saber upload script the saber can have 
multiple sets of sounds in the saber -- and using only the switchtoXXXSounds 
script can switch between which soudns are actually active.

So to upload your own sound font create a folder in the 
"Open-Saber-Sound-Toolkit" folder, copy the two CMD (Windows) or 
COMMAND (MAC-OS) files (from one of the example sound font folders) 
into your new sound font folder so you can run them there.

If the file names are not the standard ones create a switchTO script to set 
your custom filenames.

Length of sound files - the length of the sOund files does not matter - 
but short swing sounds will result in multiple swing sounds being 
played one after another (which may be noticable). Long power-on and 
power-off sounds play, but the sound does not match the length of the 
visual animation.

Uploading only a single sound using the command line should work - the 
old file is marked as deleted and the storage space for the old file is 
marked as used, the replacement file is uploaded in new spare space in 
the serial flash. There are only a limited number of times you could do 
this before the serial flash becomes full of deleted space, and then 
you will have to erase-all and upload all the files.

Erase-all also erases the settings file - but the settings in memory get 
written back to the files when the USB cable is unplugged, so you 
should not lose any custom colour banks.

# Open-Saber-Fonts
Thr required format for sound files to upload to the saber is RAW 
files with 16 bits and 44.1kHz

Older firmwares required filenames to be exactly
* CLASH_1_0.RAW
* CLASH_2_0.RAW
* CLASH_3_0.RAW
* CLASH_4_0.RAW
* CLASH_5_0.RAW
* CLASH_6_0.RAW
* CLASH_7_0.RAW
* CLASH_8_0.RAW
* CLASH_9_0.RAW
* CLASH_10_0.RAW
* HUM_0.RAW
* POWEROFF_0.RAW
* POWERON_0.RAW
* SWING_1_0.RAW
* SWING_2_0.RAW
* SWING_3_0.RAW
* SWING_4_0.RAW
* SWING_5_0.RAW
* SWING_6_0.RAW
* SWING_7_0.RAW
* SWING_8_0.RAW

## Filename Type Lists

 Upcoming Opencore firmware will allow you to specify filenames for each sound type
 allowing you to specify a list of filenames for each sound type.
 
 This will, for example, allow you to use the same sound as both a swing and a clash.
 
 Have multiple on sounds picked at random
 
 Detail a sound multiple time in a list to increase teh occurance of that one sound in the list
 
 See the batch commands in the Example_MultiON folder
 
 ..\bin\sendtosaber.exe -t sON=POWERON_0.RAW,ON_BARB.RAW,ON_DRAGON.RAW,ON_GALAXY.RAW

 The communication caommands for setting a luist of uploaded filenames
 sON=
 sOFF=
 sHUM=
 sSW=
 sCL=
 
 To get the lists back from the saber
 
 ..\bin\sendtosaber.exe -t sON?
 
 sON?
 sOFF?
 sHUM?
 sSW?
 sCL?
 
 For a proposed future protocol of paired smoothswing sounds
 sSMA=
 sSMA?
 sSMB=
 sSMB?
