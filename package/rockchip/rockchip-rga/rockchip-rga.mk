################################################################################
#
# rockchip-rga
#
################################################################################

ROCKCHIP_RGA_VERSION = $(subst /,-,$(BR2_PACKAGE_ROCKCHIP_SDK_VERSION))
ROCKCHIP_RGA_SITE = $(call gitlab,firefly-linux,external/linux-rga,$(BR2_PACKAGE_ROCKCHIP_SDK_VERSION))
ROCKCHIP_RGA_SOURCE = linux-rga-$(ROCKCHIP_RGA_VERSION).tar.bz2

ROCKCHIP_RGA_LICENSE = Apache-2.0
ROCKCHIP_RGA_LICENSE_FILES = COPYING

ROCKCHIP_RGA_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_LIBDRM),y)
ROCKCHIP_RGA_DEPENDENCIES += libdrm
ROCKCHIP_RGA_CONF_OPTS += -Dlibdrm=true
endif

$(eval $(meson-package))
