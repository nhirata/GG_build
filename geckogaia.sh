#!/bin/bash -e

# if you don't have the flash script in a repo you can get it here : 
# https://github.com/nhirata/fullflash/blob/master/flash_Gg.sh

FullflashScript="/Volumes/Projects/fullflash/flash_Gg.sh"

Gecko="out/target/product/hamachi/system/b2g"
Gaia="out/target/product/hamachi/data/local/webapps"
User="out/target/product/hamachi/system/b2g/defaults/pref/user.js"
Settings="out/target/product/hamachi/system/b2g/defaults/settings.json"
OutputFolder="gg_build"

echo "Making the directory : ${OutputFolder}"
if [ ! -d ${OutputFolder} ]; then
    mkdir ${OutputFolder}
fi

echo 
cp $FullflashScript ${OutputFolder}
mkdir ${OutputFolder}/b2g
cp -R ${Gecko} ${OutputFolder}/
mkdir ${OutputFolder}/gaia
mkdir ${OutputFolder}/gaia/profile
mkdir ${OutputFolder}/gaia/profile/prefs
cp -R ${Gaia} ${OutputFolder}/gaia/profile
cp ${User} ${OutputFolder}/gaia/profile
cp ${Settings} ${OutputFolder}/gaia/profile

zip -r ${OutputFolder}.zip ${OutputFolder}

if [ -f ${OutputFolder}.zip]; then
   rm -rf ${OutputFolder}
fi
