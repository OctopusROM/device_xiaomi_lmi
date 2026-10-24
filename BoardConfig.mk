#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/lmi

# MIUI Camera's legacy vendor makefile installs its prebuilt ELF files directly.
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Camera policy. Keep the common tree's property labels instead of the legacy ones.
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += vendor/xiaomi/lmi-miuicamera/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += vendor/xiaomi/lmi-miuicamera/sepolicy/vendor

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/lmi.config

# OTA assert
TARGET_OTA_ASSERT_DEVICE := lmi

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from the proprietary version
include vendor/xiaomi/lmi/BoardConfigVendor.mk
