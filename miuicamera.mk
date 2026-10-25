#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

MIUICAMERA_PATH := vendor/xiaomi/lmi-miuicamera

# Include directly so the legacy copy list can be adjusted before inheritance.
include $(MIUICAMERA_PATH)/lmi-miuicamera-vendor.mk

# Keep the fixed-up camera HAL libraries supplied by vendor/xiaomi/lmi.
# Use the complete permission allowlist and match the upstream JNI symlinks.
PRODUCT_COPY_FILES := $(filter-out \
    $(MIUICAMERA_PATH)/proprietary/vendor/lib64/libarcsoft_super_night_raw.so:% \
    $(MIUICAMERA_PATH)/proprietary/vendor/lib64/librelight_only.so:% \
    $(MIUICAMERA_PATH)/proprietary/vendor/lib64/libsupermoon.so:% \
    $(MIUICAMERA_PATH)/proprietary/vendor/lib64/libswregistrationalgo.so:% \
    $(MIUICAMERA_PATH)/proprietary/system/etc/permissions/privapp-permissions-miuicamera.xml:% \
    $(MIUICAMERA_PATH)/proprietary/system/lib64/libcamera_algoup_jni.xiaomi.so:% \
    $(MIUICAMERA_PATH)/proprietary/system/lib64/libcamera_mianode_jni.xiaomi.so:%, \
    $(PRODUCT_COPY_FILES))

PRODUCT_COPY_FILES += \
    $(MIUICAMERA_PATH)/configs/default-permissions/miuicamera-permissions.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default-permissions/miuicamera-permissions.xml \
    $(MIUICAMERA_PATH)/configs/permissions/privapp-permissions-miuicamera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-miuicamera.xml \
    $(MIUICAMERA_PATH)/configs/sysconfig/miuicamera-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/miuicamera-hiddenapi-package-whitelist.xml \
    $(MIUICAMERA_PATH)/proprietary/system/lib64/libcamera_algoup_jni.xiaomi.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libcamera_algoup_jni.xiaomi.so \
    $(MIUICAMERA_PATH)/proprietary/system/lib64/libcamera_mianode_jni.xiaomi.so:$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/libcamera_mianode_jni.xiaomi.so

# The common tree already supplies vendor.camera.aux.packagelist.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.lens.oem_camera_package=com.android.camera

# Use the camera's built-in consent dialog instead of MIUI Security Center.
PRODUCT_SYSTEM_PROPERTIES += \
    persist.vendor.camera.privapp.list=com.android.camera \
    ro.hardware.camera=xiaomi \
    ro.product.mod_device=lmi_global

# MiSys 3.0 needs the block library in the vendor linker namespace.
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0 \
    android.hidl.memory.block@1.0.vendor \
    android.hidl.memory.token@1.0 \
    android.hidl.memory@1.0-impl \
    android.hidl.token@1.0-utils

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(MIUICAMERA_PATH)/device_framework_matrix.xml
