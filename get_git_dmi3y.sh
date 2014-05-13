#!/bin/bash
#для скачки модекса с git у Dmi3y

echo "Installing MODx Evo dmit3y"

find ./modx.evo.custom-master/ -delete

echo "Getting file from modx.com..."
wget -O master.zip https://github.com/dmi3yy/modx.evo.custom/archive/master.zip
echo "Unzipping file..."
unzip "./master.zip" -d ./ > /dev/null

echo "Removing zip file..."
rm "./master.zip"


