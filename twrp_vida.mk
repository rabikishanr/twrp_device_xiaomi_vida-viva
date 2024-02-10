#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from vida device
$(call inherit-product, device/xiaomi/vida/device.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

## Device identifier. This must come after all inclusions

PRODUCT_DEVICE := vida
PRODUCT_NAME := twrp_vida
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := vida
PRODUCT_MANUFACTURER := xiaomi




