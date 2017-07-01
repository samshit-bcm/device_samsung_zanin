$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/zanin/zanin-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/zanin/overlay

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    	brcm_patchram_plus \
    	gralloc.rhea \
    	make_ext4fs \
    	dexopt \
    	dump_image \
    	e2fsck \
    	setup_fs \
    	screencap 

LOCAL_PATH := device/samsung/zanin
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#boot
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/samsung/zanin/init/init.rc:root/init.rc \
    device/samsung/zanin/init/fstab.rhea_ss_zanin:root/fstab.rhea_ss_zanin \
    device/samsung/zanin/init/init.bcm2165x.usb.rc:root/init.bcm2165x.usb.rc \
    device/samsung/zanin/init/init.bt.rc:root/init.bt.rc \
    device/samsung/zanin/init/init.log.rc:root/init.log.rc\
    device/samsung/zanin/init/init.rhea_ss_zanin.rc:root/init.rhea_ss_zanin.rc \
    device/samsung/zanin/init/init.zram.sh:root/init.zram.sh \
    device/samsung/zanin/init/lpm.rc:root/lpm.rc \
    device/samsung/zanin/init/sec_param.ko:root/sec_param.ko \
    device/samsung/zanin/init/ueventd.rhea_ss_zanin.rc:root/ueventd.rhea_ss_zanin.rc


$(call inherit-product, build/target/product/full.mk)

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#PRODUCT_COPY_FILES += \
#	device/samsung/zanin/vold.fstab:system/etc/vold.fstab 

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH := 240

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Misc other modules
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default

#Keyboard
PRODUCT_PACKAGES += \
    device/samsung/zanin/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/zanin/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/zanin/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/zanin/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/samsung/zanin/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_zanin
PRODUCT_DEVICE := zanin



