## Common FML Config ##

# Superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.fml.superuser

PRODUCT_PACKAGES += \
	Superuser \
	su

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.root_access=3

# Boot animation
PRODUCT_COPY_FILES += \
	vendor/fml/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# FML init.rc
PRODUCT_COPY_FILES += \
	vendor/fml/prebuilt/common/etc/init.fml.rc:root/init.fml.rc

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.setupwizard.enterprise_mode=1

# init.d support
PRODUCT_COPY_FILES += \
	vendor/fml/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/fml/prebuilt/common/etc/init.d/00fml:system/etc/init.d/00fml

# Extra tools in CM
PRODUCT_PACKAGES = \
    mke2fs \
    tune2fs \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    audio_effects.conf \
    libcyanogen-dsp \
    

WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES = \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync


PRODUCT_PACKAGES += \
	CellBroadcastReceiver \
        Apollo \
	Launcher3 \
	libffmpeg_extractor \
	libffmpeg_omx \
	media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
	media.sf.omx-plugin=libffmpeg_omx.so \
	media.sf.extractor-plugin=libffmpeg_extractor.so

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/fml/overlay/common
