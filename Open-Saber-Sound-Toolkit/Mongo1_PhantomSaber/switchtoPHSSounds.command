#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"

../bin/sendtosaber -s -t sON=PHS_ON01.RAW
../bin/sendtosaber -s -t sOFF=PHS_OFF01.RAW
../bin/sendtosaber -s -t sHUM=PHS_HUM01.RAW
../bin/sendtosaber -s -t sSW=PHS_SWING01.RAW,PHS_SWING02.RAW,PHS_SWING03.RAW,PHS_SWING04.RAW,PHS_SWING05.RAW,PHS_SWING06.RAW,PHS_SWING07.RAW
../bin/sendtosaber -s -t sCL=PHS_CLASH01.RAW,PHS_CLASH02.RAW,PHS_CLASH03.RAW,PHS_CLASH04.RAW,PHS_CLASH05.RAW,PHS_CLASH06.RAW,PHS_CLASH07.RAW,PHS_CLASH08.RAW
../bin/sendtosaber -s -t sSMA=
../bin/sendtosaber -s -t sSMB=
