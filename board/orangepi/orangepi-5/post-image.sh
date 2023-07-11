#!/bin/sh

#echo copy boot env var
#cp -a board/orangepi/orangepi-5/uboot-vars.txt ${BINARIES_DIR}/

echo copy dtb overlays
linuxDir=`find ${BASE_DIR}/build -name 'vmlinux' -type f | xargs dirname`
mkdir -p ${BINARIES_DIR}/rockchip/overlays
if [ -d ${linuxDir}/arch/arm64/boot/dts/rockchip/overlay ]; then
  cp -a ${linuxDir}/arch/arm64/boot/dts/rockchip/overlay/*.dtbo ${BINARIES_DIR}/rockchip/overlays
fi

echo copy boot variable file
cp -a board/orangepi/orangepi-5/boot-vars.txt ${BINARIES_DIR}

echo copy dtb
cp -a ${BINARIES_DIR}/rk3588s-orangepi-5.dtb ${BINARIES_DIR}/rockchip

echo creating idbloader.img
ubootDir=`find ${BASE_DIR}/build -name 'uboot-*' -type d`
${ubootDir}/tools/mkimage -n rk3588 -T rksd -d ${BINARIES_DIR}/u-boot-tpl.bin:${BINARIES_DIR}/u-boot-spl.bin ${BINARIES_DIR}/idbloader.img

echo creating boot.scr
${ubootDir}/tools/mkimage -n 'boot script' -T script -A arm -C none -d board/orangepi/orangepi-5/boot.cmd ${BINARIES_DIR}/boot.scr

${CONFIG_DIR}/support/scripts/genimage.sh -c board/orangepi/orangepi-5/genimage.cfg

echo done
