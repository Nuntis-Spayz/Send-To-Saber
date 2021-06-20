#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"

../bin/sendtosaber -s -t sON=BAR_ON01.RAW
../bin/sendtosaber -s -t sOFF=BAR_OFF01.RAW
../bin/sendtosaber -s -t sHUM=BAR_HUM01.RAW
../bin/sendtosaber -s -t sSW=BAR_SWING01.RAW,BAR_SWING02.RAW,BAR_SWING03.RAW,BAR_SWING04.RAW,BAR_SWING05.RAW,BAR_SWING06.RAW,BAR_SWING07.RAW
../bin/sendtosaber -s -t sCL=BAR_CLASH01.RAW,BAR_CLASH02.RAW,BAR_CLASH03.RAW,BAR_CLASH04.RAW,BAR_CLASH05.RAW,BAR_CLASH06.RAW,BAR_CLASH07.RAW,BAR_CLASH08.RAW,BAR_CLASH09.RAW,BAR_CLASH10.RAW,BAR_CLASH11.RAW,BAR_CLASH12.RAW,BAR_CLASH13.RAW,BAR_CLASH14.RAW
../bin/sendtosaber -s -t sSMA=
../bin/sendtosaber -s -t sSMB=
