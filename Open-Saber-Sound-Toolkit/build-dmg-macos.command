#!/bin/sh
# Script Settings
version=Open-Saber-Sound-Toolkit-r10

# Create DMG
cd -- "$(dirname "$0")"

chmod +x ../sendtosaber
cp -f ../sendtosaber ./bin-macos/
rm -dfr $version
rm -f tmp.dmg

chmod +x ./bin-macos/*.command
chmod +x ./*/*.command

mkdir $version
mkdir $version/bin/

cp bin-macos/* $version/bin/
cp -R Mongo1* $version/
cp -R Mongo2* $version/
cp -R Example* $version/
cp -R OpenCore_OEM $version/
cp *.md $version/
rm $version/*/*.cmd

rm -f *.dmg
hdiutil create tmp.dmg -ov -volname "$version" -fs HFS+ -srcfolder "./$version/" 
hdiutil convert tmp.dmg -format UDZO -o $version.dmg

rm -dfr $version
rm -f tmp.dmg
