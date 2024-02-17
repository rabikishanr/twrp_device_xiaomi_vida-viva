#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

DEVICE_PATH := device/xiaomi/vida

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 

TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53


# Assert
TARGET_OTA_ASSERT_DEVICE := vida

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := vida
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6781

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_KERNEL_TAGS_OFFSET := 0x0bc08000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_DTB_OFFSET := 0x0bc08000									   
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET)



# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x08000000 # 134217728 = 128MB
TARGET_RO_FILE_SYSTEM_TYPE ?= ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_ODM_DLKMIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_SYSTEM_DLKMIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := $(TARGET_RO_FILE_SYSTEM_TYPE)


TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor 
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_ODM_DLKM := odm_dlkm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_DLKM := system_dlkm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Display
TARGET_SCREEN_DENSITY := 440

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_USES_RECOVERY_AS_BOOT := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# System as Root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VBMETA_VENDOR := vendor
BOARD_AVB_VBMETA_VENDOR_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_VENDOR_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_VENDOR_ROLLBACK_INDEX_LOCATION := 2

BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# Hack: prevent anti rollback
# Security patch level
PLATFORM_SECURITY_PATCH := 2127-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
# Set boot SPL
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)			  

# TWRP Configuration
TW_DEFAULT_LANGUAGE := ru
TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_DEVICE_VERSION := vida-V14.0.4.0 - SK
TARGET_USES_MKE2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
TW_NO_SCREEN_TIMEOUT := true							

# Tools
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true
TW_INCLUDE_REPACKTOOLS := true

TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_APEX := true

TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true

RECOVERY_SDCARD_ON_DATA := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_HAS_NO_RECOVERY_PARTITION := true

TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := false
TW_BACKUP_EXCLUSIONS := /data/fonts/files

# Haptic
TW_SUPPORT_INPUT_AIDL_HAPTICS :=true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"

# Resolution
TW_THEME := portrait_hdpi
DEVICE_SCREEN_WIDTH := 1080
DEVICE_SCREEN_HEIGHT := 2400

# Statusbar icons flags 1080 x 2400
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "300"
TW_CUSTOM_CLOCK_POS := "70"
TW_CUSTOM_BATTERY_POS := "790"

# Device brightness path and level
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"

# This device does not support fastboot boot
TW_NO_FASTBOOT_BOOT := true
TW_INCLUDE_FASTBOOTD := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

