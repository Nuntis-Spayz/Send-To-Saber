rem del *.RAW
for /f %%f in ('dir /b *.WAV') do ..\bin\sox.exe --clobber %%f -t raw -b 16 -c 1 -r 44100 %%f_RAW
ren *.wav_RAW *.RAW
pause
