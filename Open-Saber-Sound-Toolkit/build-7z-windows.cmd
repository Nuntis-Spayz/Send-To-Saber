@echo off
clear
echo ------------------------------------------------------------------
echo "  Build 7zip Archive of Windows & Sample Sound Fonts"
echo ------------------------------------------------------------------
echo.

set file=Open-Saber-Sound-Toolkit-r9

del %file%.7z
del %file%-SFX.exe
copy /Y ..\sendtosaber_x*.exe bin-win\
copy /Y ..\sendtosaber_x32.exe bin-win\sendtosaber.exe

7z a -mx9 %file%.7z bin-win\*.*
7z rn -mx9 %file%.7z bin-win bin
7z a -r -mx9 %file%.7z Mongo1*\*.*
7z a -r -mx9 %file%.7z OpenCore_OEM\*.*
7z d -r -mx9 %file%.7z *.command
7z a -r -mx9 %file%.7z *.md

7z a -mx9 -sfx %file%-SFX.exe bin-win\*.*
7z rn -mx9   %file%-SFX.exe bin-win bin
7z a -r -mx9 %file%-SFX.exe Mongo1*\*.*
7z a -r -mx9 %file%-SFX.exe OpenCore_OEM\*.*
7z d -r -mx9 %file%-SFX.exe *.command
7z a -r -mx9 %file%-SFX.exe *.md

pause
exit
