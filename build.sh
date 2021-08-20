#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

MANIFEST="git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_10.0"
DEVICE=CD6
DT_LINK=https://github.com/Mikesew1320/TECNO-CD6-SHRP-Tree -b android-10.0"
DT_PATH=device/TECNO/$DEVICE

echo " ===+++ Setting up Build Environment +++==="
apt install openssh-server -y
apt update --fix-missing
apt install openssh-server -y
mkdir ~/shrp && cd ~/shrp

echo " ===+++ Syncing Recovery Sources +++==="
repo init -u $MANIFEST --depth=1 --groups=all,-notdefault,-device,-darwin,-x86,-mips
repo sync -c -q --force-sync --no-clone-bundle --no-tags -j6
#repo init --depth=1 -u $MANIFEST
#repo sync
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
