BR2_PACKAGE_ROCKCHIP_SDK_VERSION := $(patsubst "%",%,$(BR2_PACKAGE_ROCKCHIP_SDK_VERSION))
include $(sort $(wildcard package/rockchip/*/*.mk))
