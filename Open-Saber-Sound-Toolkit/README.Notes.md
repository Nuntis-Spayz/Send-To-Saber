## Instructions as Provided over Chat/Social Media to those asking for Help beyond the Standard ReadMe File

Download the "Sound Upload Tookit" from my webpage at 
http://sabers.amazer.uk/?p=gilthoniel

Once you have extracted it to a location on your harddrive, read the README.md file for instrcutions.

The toolkit contains the original and some example sound fonts and a utility to convert sound files into the correct format.

Any specific questions feel free to ask me once you have read the included instructions and these notes.

The toolkit includes/uses a command line tool "sendtosaber.exe" (on MacOS sendtosaber) to communicate with the saber and transfer files - and the original source files for tosaber are available on GitHub 
https://github.com/Nuntis-Spayz/Send-To-Saber

The toolkit has a batch upload script/batch file to upload a complete set of sound files in one go, which erases all teh files in the saber memory and then uploads the files one after another - it is not fast, but unlike the old Fiamma Manager software - you can start it off and walk away for ten minutes instead of having to manually upload one at a time.

The sendtosaber command can also query the saber and erase the memory

Send-To-Saber
----------------
Version: 0.1.0.17

No Parameters, minimum filename required.

Usage: sendtosaber.exe [-h -v -i -l -s -t --trans=string -erase-all] <filename.ext>
  -h   --help             -- show this help
  -v   --version          -- display version no.
  -i   --info             -- read saber firmware version and serial no.
  -l   --list             -- list all files on saber
  --slist                 -- list the arrays of sound filenames
  -s   --silent           -- do not wait for a key at the end
  -t string-to-send       -- send/transmit string to the saber & show responses
  --trans=string-to-send  -- send/transmit string to the saber & show responses
  -erase-all              -- erase the serial flash
  <filename.ext>          -- send the named file to serial flash storage

Using the sendtosaber command you could manually send one file at a time.

NOTE: uploading a replacement file stores the new file in new space in the saber memory and marks the old file and space as deleted -- repeatedly uploading the same file will eventually fill up the saber memory and you would then have to -erase-all and upload all the files.

This might be suitable if you are testing one file at a time until it sounds right, but eventually you will have to -erase-all and re upload every sound.

You can check the space on the saber by sending the list command "sendtosaber -l" and the used/free space is displayed at the bottom of the listing]

The batch upload command does an erase-all and then sends all the sounds one after another to the saber to avoid the 'erased files' taking up dead space problem.

If you want to upload multiple, differently named sound fonts you will need to ensure your batch upload script does NOT erase-all when it runs leaving previous sound files on teh saber, ensure you have customised the sound font filetype lists of filesnames (see end of main readme ans example switchtoXXXX scripts)
