These binary files include (when zipped up by the builder scripts)

sendtosaber
===========
Command line application to send a file to Open-Core saber.

    Usage: sendtosaber [-h -v -i -l -s -erase-all] <filename.ext>
    -h --help       -- show this help
    -v --version    -- display version no.
    -i --info       -- read saber firmware version and serial no.
    -l --list       -- list all files on saber
    -s --silent     -- do not wait for a key at the end
    -erase-all      -- erase the serial flash
    <filename.ext>  -- send the named file

Sendtosaber Batch files
=======================
Batch files to call the above command and optionally convert audio files
before sending them to the saber

sox
===
- a sound audio toolkit 
  sox is available under the GPL2.0 at
  http://sox.sourceforge.net/
  https://sourceforge.net/projects/sox/

see the individual README for sox
