#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"
../bin/sendtosaber -s -erase-all

../bin/sox --clobber CLASH_1_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_1_0.RAW
../bin/sox --clobber CLASH_2_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_2_0.RAW
../bin/sox --clobber CLASH_3_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_3_0.RAW
../bin/sox --clobber CLASH_4_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_4_0.RAW
../bin/sox --clobber CLASH_5_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_5_0.RAW
../bin/sox --clobber CLASH_6_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_6_0.RAW
../bin/sox --clobber CLASH_7_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_7_0.RAW
../bin/sox --clobber CLASH_8_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_8_0.RAW
../bin/sox --clobber CLASH_9_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_9_0.RAW
../bin/sox --clobber CLASH_10_0.wav -t raw -b 16 -c 1 -r 44100 CLASH_10_0.RAW

../bin/sox --clobber HUM_0.wav -t raw -b 16 -c 1 -r 44100 HUM_0.RAW
../bin/sox --clobber POWEROFF_0.wav -t raw -b 16 -c 1 -r 44100 POWEROFF_0.RAW
../bin/sox --clobber POWERON_0.wav -t raw -b 16 -c 1 -r 44100 POWERON_0.RAW

../bin/sox --clobber SWING_1_0.wav -t raw -b 16 -c 1 -r 44100 SWING_1_0.RAW
../bin/sox --clobber SWING_2_0.wav -t raw -b 16 -c 1 -r 44100 SWING_2_0.RAW
../bin/sox --clobber SWING_3_0.wav -t raw -b 16 -c 1 -r 44100 SWING_3_0.RAW
../bin/sox --clobber SWING_4_0.wav -t raw -b 16 -c 1 -r 44100 SWING_4_0.RAW
../bin/sox --clobber SWING_5_0.wav -t raw -b 16 -c 1 -r 44100 SWING_5_0.RAW
../bin/sox --clobber SWING_6_0.wav -t raw -b 16 -c 1 -r 44100 SWING_6_0.RAW
../bin/sox --clobber SWING_7_0.wav -t raw -b 16 -c 1 -r 44100 SWING_7_0.RAW
../bin/sox --clobber SWING_8_0.wav -t raw -b 16 -c 1 -r 44100 SWING_8_0.RAW

