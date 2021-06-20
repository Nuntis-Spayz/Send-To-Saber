#!/bin/bash
clear
cd "$(dirname "$BASH_SOURCE")"
../bin/sendtosaber -s -erase-all

shopt -s nullglob

for file in ./*.RAW; do
  ../bin/sendtosaber -s "$file"
done

