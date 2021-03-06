SUPERUSER_EMBEDDED := true

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/iokp/overlay/common

# Common dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/iokp/overlay/dictionaries

PRODUCT_PACKAGES += \
    BluetoothExt \
    CellBroadcastReceiver \
    libemoji \
    LatinImeDictionaryPack \
    mGerrit \
    Microbes \
    ROMControl \
    Stk \
    su \
    SwagPapers \
    Torch \
    UnicornPorn

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enterprise_mode=1 \
    windowsmgr.max_events_per_sec=240 \
    ro.kernel.android.checkjni=0 \
    persist.sys.root_access=3

# Installer
PRODUCT_COPY_FILES += \
    vendor/iokp/prebuilt/common/bin/persist.sh:install/bin/persist.sh \
    vendor/iokp/prebuilt/common/etc/persist.conf:system/etc/persist.conf

PRODUCT_COPY_FILES += \
    vendor/iokp/prebuilt/common/lib/libmicrobes_jni.so:system/lib/libmicrobes_jni.so \
    vendor/iokp/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# init.d
PRODUCT_COPY_FILES += \
    vendor/iokp/prebuilt/common/etc/init.local.rc:root/init.aokp.rc \
    vendor/iokp/prebuilt/common/etc/init.d/00start:system/etc/init.d/00start \
    vendor/iokp/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/iokp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/iokp/prebuilt/common/bin/sysinit:system/bin/sysinit

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    libssh \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh \
    sftp \
    scp \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Scarabaeus.ogg \
    ro.config.notification_sound=Antimony.ogg \
    ro.config.alarm_alert=Scandium.ogg

PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Inherit common build.prop overrides
-include vendor/iokp/configs/common_versions.mk

# T-Mobile theme engine
-include vendor/iokp/configs/themes_common.mk

# common boot animation
PRODUCT_COPY_FILES += \
    vendor/iokp/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# World APNs
PRODUCT_COPY_FILES += \
    vendor/iokp/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# IOKP RELEASE VERSION
IOKP_VERSION_MAJOR = v3
IOKP_VERSION_MINOR = 0



VERSION := $(IOKP_VERSION_MAJOR).$(IOKP_VERSION_MINOR)

ifeq ($(DEVELOPER_VERSION),true)
    IOKP_VERSION := dev_$(BOARD)-$(VERSION)-$(shell date -u +%Y%m%d)
else
    IOKP_VERSION := $(TARGET_PRODUCT)-$(VERSION)-$(shell date -u +%Y%m%d)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(IOKP_VERSION) \
    ro.iokp.version=$(VERSION) 
