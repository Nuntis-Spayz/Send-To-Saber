#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"

../bin/sendtosaber -s -t sON=POWERON_0.RAW
../bin/sendtosaber -s -t sOFF=POWEROFF_0.RAW
../bin/sendtosaber -s -t sHUM= HUM_0.RAW
../bin/sendtosaber -s -t sSW=SWING_1_0.RAW,SWING_2_0.RAW,SWING_3_0.RAW,SWING_4_0.RAW,SWING_5_0.RAW,SWING_6_0.RAW
../bin/sendtosaber -s -t sCL=CLASH_1_0.RAW,CLASH_2_0.RAW,CLASH_3_0.RAW,CLASH_4_0.RAW,CLASH_5_0.RAW,CLASH_6_0.RAW,CLASH_7_0.RAW,CLASH_8_0.RAW,CLASH_9_0.RAW,CLASH_10_0.RAW
../bin/sendtosaber -s -t sSMA=
../bin/sendtosaber -s -t sSMB=
