# Inherit AOSP device configuration for Ascend.
$(call inherit-product, device/huawei/ascend/ascend.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_ascend
PRODUCT_BRAND := Huawei
PRODUCT_DEVICE := ascend
PRODUCT_MODEL := M860
PRODUCT_MANUFACTURER := Huawei
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=sojus BUILD_ID=GRJ90 BUILD_DISPLAY_ID=$(shell date +%m%d%Y) BUILD_FINGERPRINT=google/soju/crespo:2.3.5/GRJ90/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.5 GRJ90 121341 release-keys" BUILD_NUMBER=121341 PRODUCT_DEVICE=M860

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=../../../../device/huawei/ascend/include/prelink-linux-arm-ascend.map

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CM7.2-Ascend-Nightly$(shell date +%m%d%Y)
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM-7.2RC-Ascend
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CM7.2-Ascend-$(shell date +%m%d%Y)
    endif
endif

#
# Copy legend specific prebuilt files
#
# Lights and graphics
PRODUCT_COPY_FILES += \
   vendor/huawei/ascend/proprietary/lib/hw/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so

PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/lib/hw/lights.msm7k.so:system/lib/hw/lights.msm7k.so

# Proprietary RIL related
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/lib/libril.so:system/lib/libril.so
PRODUCT_COPY_FILES += \
    vendor/huawei/ascend/proprietary/lib/libwpa_client.so:system/lib/libwpa_client.so

