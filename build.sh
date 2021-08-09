#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_11.0"
DEVICE=LD7
DT_LINK="https://github.com/macukex1991/android_device_TECNO_LD7.git -b SHRP"
DT_PATH=device/TECNO/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/shrp && cd ~/shrp

echo " ===+++ Syncing Recovery Sources +++==="
repo init --depth=1 -u $MANIFEST
repo sync
git clone --depth=1 $DT_LINK $DT_PATH

echo " ===+++ Building Recovery +++==="
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
lunch omni_${DEVICE}-eng
mka recoveryimage

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
echo " ===+++ Uploading Recovery +++==="

cd out/target/product/$DEVICE
curl -sL https://git.io/file-transfer | sh
./transfer wet *.zip
