#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="https://gitlab.com/OrangeFoxRecovery/fox_10.0/manifest.git"
DEVICE=CD6
DT_LINK="https://github.com/Mikesew1320/twrp_device_TECNO_CD6"
DT_PATH=device/TECNO/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/twrp11 && cd ~/twrp11

echo " ===+++ Syncing Recovery Sources +++==="
repo init --depth=1 -u $MANIFEST
repo sync
git clone --depth=1 $DT_LINK $DT_PATH

echo " ===+++ Building Recovery +++==="
. build/envsetup.sh
#export TW_THEME=portrait_hdpi
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_${DEVICE}-eng || abort " lunch failed with exit status $?"
echo " lunch twrp_${DEVICE}-eng done"
mka recoveryimage || abort " mka failed with exit status $?"
echo " mka recoveryimage done"

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
echo " ===+++ Uploading Recovery +++==="
version=$(cat bootable/recovery/variables.h | grep "define TW_MAIN_VERSION_STR" | cut -d \" -f2)
OUTFILE=SHRP-3.1-${DEVICE}-$(date "+%Y%m%d-%I%M").zip

cd out/target/product/$DEVICE
curl -sL https://git.io/file-transfer | sh
./transfer $OUTFILE  *.zip
./transfer wet *.zip