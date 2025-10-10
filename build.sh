#!/bin/bash

# Repo Init
repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs --no-clone-bundle

# Sync the repositories
/opt/crave/resync.sh

# Remove existing directories

# remove device trees
rm -rf device/xiaomi/beryllium
rm -rf device/xiaomi/sdm845-common
# remove vendor
rm -rf vendor/xiaomi/beryllium
rm -rf vendor/xiaomi/sdm845-common
# remove kernel
rm -rf kernel/xiaomi/sdm845
# remove hardware
rm -rf hardware/xiaomi
# remove hals
rm -rf hardware/qcom-caf/sdm845/media
rm -rf hardware/qcom-caf/sdm845/audio
rm -rf hardware/qcom-caf/sdm845/display
# remove sepolicy
rm -rf device/lineage/sepolicy
rm -rf device/qcom/sepolicy_vndr/legacy-um

# Clone repositories #

# Device tree
git clone https://github.com/duckyduckG/android_device_xiaomi_beryllium_419.git -b lineage-23.0 device/xiaomi/beryllium
git clone https://github.com/duckyduckG/android_device_xiaomi_sdm845-common_419.git -b lineage-23.0 device/xiaomi/sdm845-common

# Vendor
git clone https://github.com/duckyduckG/android_vendor_xiaomi_beryllium_419.git -b lineage-23.0 vendor/xiaomi/beryllium
git clone https://github.com/duckyduckG/android_vendor_xiaomi_sdm845-common_419.git -b lineage-23.0 vendor/xiaomi/sdm845-common

# Kernel
git clone https://github.com/duckyduckG/android_kernel_xiaomi_sdm845_419.git -b perf kernel/xiaomi/sdm845
# kernel techpack
git clone https://github.com/duckyduckG/kernel_techpack_mi845_419.git kernel/xiaomi/sdm845/techpack/mi845
# kernel device tree
git clone https://github.com/duckyduckG/devicetree_xiaomi_419.git kernel/xiaomi/sdm845/arch/arm64/boot/dts/xiaomi
git clone https://github.com/duckyduckG/devicetree_qcom-sdm845_419.git kernel/xiaomi/sdm845/arch/arm64/boot/dts/qcom-sdm845

# Hardware
git clone https://github.com/duckyduckG/android_hardware_xiaomi.git -b lineage-23.0 hardware/xiaomi

# Hals
git clone https://github.com/duckyduckG/media.git hardware/qcom-caf/sdm845/media
git clone https://github.com/duckyduckG/audio.git hardware/qcom-caf/sdm845/audio
git clone https://github.com/duckyduckG/display.git hardware/qcom-caf/sdm845/display

# Sepolicy
git clone https://github.com/duckyduckG/android_device_lineage_sepolicy.git -b lineage-23.0 device/lineage/sepolicy
git clone https://github.com/duckyduckG/android_device_qcom_sepolicy_vndr.git -b lineage-23.0-legacy-um device/qcom/sepolicy_vndr/legacy-um

# lineageos-brunch
source build/envsetup.sh
brunch beryllium
