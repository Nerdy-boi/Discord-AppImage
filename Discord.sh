#!/bin/bash

mkdir Discord.AppDir
mkdir Discord.AppDir/usr
mkdir Discord.AppDir/usr/bin
mkdir Discord.AppDir/usr/lib

wget -O Discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz"
wget -O appimagetoolx64.AppImage https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetoolx64.AppImage

tar -xf Discord.tar.gz --strip-components=1 --directory Discord.AppDir/usr/bin
cp Discord.AppDir/usr/bin/discord.png Discord.AppDir/discord.png
cp Discord.AppDir/usr/bin/discord.desktop Discord.AppDir/discord.desktop
wget https://raw.githubusercontent.com/AppImage/AppImageKit/master/resources/AppRun
chmod a+x AppRun
mv AppRun Discord.AppDir/AppRun
sed -i -e 's#/usr#././#g' Discord.AppDir/usr/bin/Discord
ldd Disord.AppDir/usr/bin/Disord | grep "=> /" | awk '{print $3}' | xargs -I '{}' cp -v '{}' discord.AppDir/usr/lib
sed -i -r 's+/usr/share/discord/Discord+Discord+g' Discord.AppDir/discord.desktop
ARCH=x86_64 ./appimagetoolx64.AppImage Discord.AppDir