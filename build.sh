#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="https://gitlab.com/OrangeFoxRecovery/fox_10.0/manifest.git"
DEVICE=CD6
DT_LINK="https://github.com/Mikesew1320/TECNO-CD6-OFRP-Tree"
DT_PATH=device/TECNO/$DEVICE
TARGET: recoveryimage
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER: 1
TZ: Asia/Kolkata
BOT_TOKEN: 1454073957:AAEns-uDLDPvx0_oTLVN9uVR0ZmJJhfIIdk
CHAT_ID: -418101214

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/twrp11 && cd ~/twrp11
  sudo rm -rf /usr/share/dotnet /etc/mysql /etc/php /etc/apt/sources.list.d
            docker rmi `docker images -q`
            sudo apt-get remove account-plugin-facebook account-plugin-flickr account-plugin-jabber account-plugin-salut account-plugin-twitter account-plugin-windows-live account-plugin-yahoo aisleriot brltty duplicity empathy empathy-common example-content gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine landscape-common libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-galaxy libreoffice-style-human libreoffice-writer libsane libsane-common mcp-account-manager-uoa python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common telepathy-gabble telepathy-haze telepathy-idle telepathy-indicator telepathy-logger telepathy-mission-control-5 telepathy-salut totem totem-common totem-plugins printer-driver-brlaser printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-m2300w printer-driver-ptouch printer-driver-splix
            git config --global user.name "Mikesew1320"
            git config --global user.email "mikesew1320@gmail.com"         
            sudo -E apt-get -y purge azure-cli ghc* zulu* hhvm llvm* firefox google* dotnet* powershell openjdk* mysql* php* 
            sudo -E apt-get clean 
            sudo -E apt-get -qq update
            sudo apt install git aria2 -y
            git clone https://gitlab.com/OrangeFox/misc/scripts &&cd scripts
            sudo bash setup/android_build_env.sh
            sudo bash setup/install_android_sdk.sh

echo " ===+++ Syncing Recovery Sources +++==="
repo init --depth=1 -u $MANIFEST
repo sync
git clone --depth=1 $DT_LINK $DT_PATH                        
             mkdir ~/OrangeFox_10
             cd ~/OrangeFox_10
             git clone https://gitlab.com/OrangeFox/sync.git
             cd ~/OrangeFox_10/sync
             echo 'y' | ./get_fox_10.sh ~/OrangeFox_10/fox_10.0
             cd ~/OrangeFox_10/fox_10.0
             git clone $DT_LINK $DT_PATH
             #cd ~/OrangeFox_10/vendor/recovery
             #git fetch https://gitlab.com/Yillie/vendor_recovery fox_10.0
             #git cherry-pick 8212a5516cf9dece1f93cb3cafb6bcd69d261f7e
             
echo " ===+++ Building Recovery +++==="
. build/envsetup.sh
           cd ~/OrangeFox_10/fox_10.0
              source build/envsetup.sh
              export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1 
              export LC_ALL="C"
#export TW_THEME=portrait_hdpi
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_${DEVICE}-eng || abort " lunch failed with exit status $?"
echo " lunch twrp_${DEVICE}-eng done"
mka recoveryimage || abort " mka failed with exit status $?"
echo " mka recoveryimage done"

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
echo " ===+++ Uploading Recovery +++==="
   cd ~/OrangeFox_10/fox_10.0/out/target/product/CD6
              curl -F chat_id=$CHAT_ID -F document=@OFRP-v11.1-CD6.zip https://api.telegram.org/bot$BOT_TOKEN/sendDocument
              sudo zip -r9 OFRP-v11.1-CD6.zip recovery.img
              version=$(cat bootable/recovery/variables.h | grep "define TW_MAIN_VERSION_STR" | cut -d \" -f2)
              OUTFILE=OFRP-${version}-${DEVICE}-$(date "+%Y%m%d-%I%M").zip
              curl -F chat_id=$CHAT_ID -F document=@OFRP-v11.1-CD6.zip https://api.telegram.org/bot$BOT_TOKEN/sendDocument
              curl -sL https://git.io/file-transfer | sh
              ./transfer wet OFRP-v11.1-CD6.zip
              curl -T $OUTFILE https://oshi.at
              ./transfer wet recovery.img
              ./transfer wet *.zip

