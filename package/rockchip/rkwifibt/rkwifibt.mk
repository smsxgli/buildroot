################################################################################
#
# rkwifibt
#
################################################################################

RKWIFIBT_VERSION = $(subst /,-,$(BR2_PACKAGE_ROCKCHIP_SDK_VERSION))
RKWIFIBT_SITE = $(call gitlab,firefly-linux,external/rkwifibt,$(BR2_PACKAGE_ROCKCHIP_SDK_VERSION))
RKWIFIBT_SOURCE = rkwifibt-$(RKWIFIBT_VERSION).tar.bz2
RKWIFIBT_LICENSE = ROCKCHIP
RKWIFIBT_LICENSE_FILES = LICENSE

$(eval $(meson-package))
