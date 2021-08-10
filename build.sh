#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="https://gitlab.com/OrangeFox/sync.git"
DEVICE=LD7
DT_LINK="https://github.com/macukex1991/android_device_TECNO_LD7 -b android-10"
DT_PATH=device/TECNO/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
#mkdir ~/twrp10 && cd ~/twrp10

echo " ===+++ Syncing Recovery Sources +++==="
git clone $MANIFEST k
cd k
./get_fox_10.sh ~/work
cd ~/work
git clone $DT_LINK --depth=1 --single-branch $DT_PATH

echo " ===+++ Building Recovery +++==="
cd ~/work
 . build/envsetup.sh
 export ALLOW_MISSING_DEPENDENCIES=true
 lunch omni_$DEVICE-eng && mka recoveryimage

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
echo " ===+++ Uploading Recovery +++==="

cd ~/work/out/target/product/*/*.zip
curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip
