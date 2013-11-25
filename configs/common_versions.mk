# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

DATE = $(shell vendor/iokp/tools/getdate)
IOKP_BRANCH=jb-mr2

ifneq ($(IOKP_BUILD),)
    # IOKP_BUILD=<goo version int>/<build string>
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.developerid=iokp \
        ro.goo.rom=iokp \
        ro.goo.version=$(shell echo $(IOKP_BUILD) | cut -d/ -f1) \
        ro.iokp.version=$(TARGET_PRODUCT)_$(IOKP_BRANCH)_$(shell echo $(IOKP_BUILD) | cut -d/ -f2)
else
    ifneq ($(IOKP_NIGHTLY),)
        # IOKP_NIGHTLY=true
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.iokp.version=$(TARGET_PRODUCT)_nightly_$(DATE)
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.iokp.version=$(TARGET_PRODUCT)_unofficial_$(DATE)
    endif
endif

# needed for statistics
PRODUCT_PROPERTY_OVERRIDES += \
        ro.iokp.branch=$(IOKP_BRANCH) \
        ro.iokp.device=$(IOKP_PRODUCT)

# Camera shutter sound property
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.camera-sound=1
