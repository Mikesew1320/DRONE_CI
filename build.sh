#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni -b twrp-10.0"
DEVICE=CD6
DT_LINK="https://github.com/Mikesew1320/TECNO-CD6-TWRP-Tree"
DT_PATH=device/TECNO/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/twrp10 && cd ~/twrp10

echo " ===+++ Syncing Recovery Sources +++==="
repo init --depth=1 -u $MANIFEST
repo sync
git clone --depth=1 $DT_LINK $DT_PATH

echo " ===+++ Building Recovery +++==="
. build/envsetup.sh
export TW_THEME=portrait_hdpi
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_${DEVICE}-eng && mka recoveryimage

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
echo " ===+++ Uploading Recovery +++==="
version=$(cat bootable/recovery/variables.h | grep "define TW_MAIN_VERSION_STR" | cut -d \" -f2)
OUTFILE=TWRP-${version}-${DEVICE}-$(date "+%Y%m%d-%I%M").zip

cd out/target/product/$DEVICE
mv recovery.img ${OUTFILE%.zip}.img
zip -r9 $OUTFILE ${OUTFILE%.zip}.img

#curl -T $OUTFILE https://oshi.at
curl -sL $OUTFILE https://git.io/file-transfer | sh
./transfer wet *.zip
