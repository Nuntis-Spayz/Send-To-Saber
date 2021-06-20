REM ..\bin\sendtosaber.exe -s -erase-all

for /f %%f in ('dir /b *.RAW') do ..\bin\sendtosaber.exe -s %%f

pause
