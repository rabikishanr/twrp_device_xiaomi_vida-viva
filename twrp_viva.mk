#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from viva device
$(call inherit-product, device/xiaomi/viva/device.mk)

PRODUCT_DEVICE := viva
PRODUCT_NAME := twrp_viva
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := viva
PRODUCT_MANUFACTURER := xiaomi
