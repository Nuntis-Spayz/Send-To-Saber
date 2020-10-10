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

The three other Mongo1_<something> folders contain sample open-source 
sound fonts Mongo1_Barbarian sounds are already converted into the 
correct RAW sound format — again run the sendtosaber-all-raw and 
it will erase all the sounds and upload this set (again it is not fast).

The Dragon and Galaxy Blade folders contain WAV files — ie. not in the 
correct RAW sound format - but with the correct file names.

Running the command sox-convert-toRAW command 
  - Windows : "sox-convert-toRAW.cmd"
  - MAC OS  : "sox-convert-toRAW-macos.command"

will convert the WAV files into the correct RAW format then once more 
you can run the sendtosaber-all-raw to upload them to the saber.

So to upload your own sound font create a folder in the 
"Open-Saber-Sound-Toolkit" folder, copy the two CMD (Windows) or 
COMMAND (MAC-OS) files (from one of the example sound font folders) 
into your new sound font folder so you can run them there.

Then create the correct sound files with the EXACT same sound names as 
in the original and examples - run the converter and/or the uploader

You Must have a sound file for EVERY single sound required - if you 
omit one the saber will play blank sounds occassionally.

Length of sound files - the length of the sund files does not matter - 
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

Current required filenames are
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
