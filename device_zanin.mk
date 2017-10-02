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
# ifeq ($(TARGET_PREBUILT_KERNEL),)
# 	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
# else
# 	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
# endif

#boot
PRODUCT_COPY_FILES += \
    device/samsung/zanin/init/fstab.rhea_ss_zanin:root/fstab.rhea_ss_zanin \
    device/samsung/zanin/init/init.bcm2165x.usb.rc:root/init.bcm2165x.usb.rc \
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

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
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

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    mobiledata.interfaces=rmnet0 \
	ro.telephony.ril_class=SamsungBCMRIL


# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# LDPI assets
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
$(call inherit-product, device/ldpi-common/ldpi.mk)

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

# Wifi
PRODUCT_PACKAGES += \
	macloader \
	dhcpcd.conf \
	hostapd \
	libnetcmdiface \
	wpa_supplicant \
	wpa_supplicant.conf


#Keyboard
PRODUCT_COPY_FILES += \
    device/samsung/zanin/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/zanin/keychars/bcm_keypad_v2.kcm:system/usr/keychars/bcm_keypad_v2.kcm \
    device/samsung/zanin/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/samsung/zanin/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/samsung/zanin/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/samsung/zanin/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/zanin/keylayout/bcm_headset.kl:system/usr/keylayout/bcm_headset.kl \
    device/samsung/zanin/keylayout/bcm_keypad_v2.kl:system/usr/keylayout/bcm_keypad_v2.kl \
    device/samsung/zanin/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/zanin/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/samsung/zanin/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/zanin/keylayout/samsung-keypad.kl:system/usr/keylayout/samsung-keypad.kl \
    device/samsung/zanin/keylayout/Zinitix_tsp.kl:system/usr/keylayout/Zinitix_tsp.kl

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_zanin
PRODUCT_DEVICE := zanin
