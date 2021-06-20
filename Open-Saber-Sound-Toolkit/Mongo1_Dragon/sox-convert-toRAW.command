#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"

shopt -s nullglob

for file in ./*.WAV; do
  newname=${file%.WAV}.RAW
  ../bin/sox --clobber "$file" -t raw -b 16 -c 1 -r 44100 "$newname"
done

for file in ./*.wav; do
  newname=${file%.wav}.RAW
  ../bin/sox --clobber "$file" -t raw -b 16 -c 1 -r 44100 "$newname"
done
