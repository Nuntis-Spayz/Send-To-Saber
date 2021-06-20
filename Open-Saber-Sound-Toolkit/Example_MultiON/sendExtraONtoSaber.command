#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"

..\bin\sendtosaber -s ON_BARB.RAW
..\bin\sendtosaber -s ON_DRAGON.RAW
..\bin\sendtosaber -s ON_GALAXY.RAW

..\bin\sendtosaber -t sON=POWERON_0.RAW,ON_BARB.RAW,ON_DRAGON.RAW,ON_GALAXY.RAW
