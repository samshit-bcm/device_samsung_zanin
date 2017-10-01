USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/zanin/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true

# Architecture
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_ARCH:=arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_LOWMEM := true 
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := rhea
TARGET_BOARD_PLATFORM := rhea
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096

TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfloat-abi=softfp

#Assert
TARGET_OTA_ASSERT_DEVICE := zanin

# fix this up by examining /proc/mtd on a running device
BOARD_KERNELIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 939524096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2236070912
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
BOARD_FLASH_BLOCK_SIZE := 4096

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 mem=480M gpt pmem=112M carveout=18M androidboot.console=ttyS1
TARGET_KERNEL_SOURCE := kernel/samsung/zanin
TARGET_KERNEL_CONFIG := cyanogenmod_zanin_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.4.3
###############

ENABLE_WEBGL := true

###########
TARGET_USERIMAGES_USE_EXT4 := true

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4334
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

#bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/zanin/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/zanin/libbt_vndcfg.txt

#egl
BUILD_EMULATOR_OPENGL := true
BOARD_EGL_CFG := device/samsung/zanin/configs/egl.cfg
USE_OPENGL_RENDERER := true
HWUI_COMPILE_FOR_PERF := true
BOARD_EGL_NEEDS_LEGACY_FB := true
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
WITH_DEXPREOPT := false
endif

#audio
BOARD_USES_ALSA_AUDIO := true
BRCM_ALSA_LIB_DIR=device/samsung/bcm_common/alsa-lib
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DSAMSUNG_BCM_AUDIO_BLOB

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

#recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_LDPI_RECOVERY := true
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/zanin/ril/

# UMS
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/dwc_otg/gadget/lun0/file"

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

#adb
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.allow.mock.location=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.debuggable=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1
ADDITIONAL_DEFAULT_PROPERTIES += ro.config.sec_storage=1
ADDITIONAL_DEFAULT_PROPERTIES += persist.sys.usb.config=mtp,adb
