# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from msm8974-common
include device/sony/msm8974-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH += device/sony/rhine-common/include

# Platform
BOARD_VENDOR_PLATFORM := rhine
PRODUCT_PLATFORM := rhine

# Kernel information
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_CMDLINE  := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1 vmalloc=300M dwc3.maximum_speed=high dwc3_msm.prop_chg_detect=Y
BOARD_KERNEL_CMDLINE  += androidboot.selinux=permissive
BOARD_KERNEL_SEPARATED_DT := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"

# Audio
USE_LEGACY_LOCAL_AUDIO_HAL := true
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Partition
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2436890624
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Camera
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/vendor/bin/mm-qcamera-daemon=22

# FM Radio
AUDIO_FEATURE_ENABLED_FM := true
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Init
TARGET_INIT_VENDOR_LIB      := libinit_rhine
TARGET_LIBINIT_DEFINES_FILE := device/sony/rhine-common/init/init_rhine.cpp

# Shims
TARGET_LD_SHIM_LIBS := \
    /vendor/bin/credmgrd|/vendor/lib/libshims_signal.so \
    /vendor/bin/suntrold|/vendor/lib/libshims_signal.so \
    /system/lib/hw/camera.vendor.qcom.so|/vendor/lib/libshim_camera.so \
    /system/lib/hw/camera.vendor.qcom.so|/vendor/lib/libshim_cald.so \
    /system/lib/hw/camera.vendor.qcom.so|libsensor.so \
    /system/lib/libcald_pal.so|/vendor/lib/libshim_cald.so \
    /system/lib/libcammw.so|/vendor/lib/libshim_cald.so \
    /system/lib/libcammw.so|libsensor.so \
    /system/vendor/bin/mm-qcamera-daemon|/vendor/lib/libshim_atomic.so \
    /system/vendor/bin/mm-qcamera-daemon|libandroid.so \
    /system/lib/libsomc_chokoballpal.so|/vendor/lib/libshim_camera.so

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/sony/rhine-common/sepolicy

# Platform props
TARGET_SYSTEM_PROP += device/sony/rhine-common/system.prop

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true

# RIL
BOARD_PROVIDES_LIBRIL := true
TARGET_USES_OLD_MNC_FORMAT := true

# Recovery
TARGET_RECOVERY_FSTAB := device/sony/rhine-common/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# Security patch level
VENDOR_SECURITY_PATCH := 2015-11-19
