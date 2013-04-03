#!/bin/bash

set -e

[ -e custom-kernels ] || mkdir custom-kernels

export PATH=$(pwd)/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin:$PATH
export ARCH=arm
export SUBARCH=arm
export CROSS_COMPILE=arm-eabi-

cd goldfish


#build with tun support compiled in
[ -f .config ] && rm .config
make goldfish_defconfig
grep -v CONFIG_TUN .config > .config2
mv .config2 .config
echo CONFIG_TUN=y >> .config
make
cp arch/arm/boot/zImage ../custom-kernels/zImage-tun-y


#build with tun support as module
[ -f .config ] && rm .config
make goldfish_defconfig
grep -v CONFIG_TUN .config > .config2
mv .config2 .config
cat - >> .config << EOF
CONFIG_TUN=m

CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_MODVERSIONS=y
CONFIG_MODULE_SRCVERSION_ALL=n

CONFIG_KPROBES=n
CONFIG_MTD_TESTS=n
CONFIG_MEILHAUS=n
CONFIG_COMEDI=n
CONFIG_CRYPTO_TEST=n
EOF
make
cp arch/arm/boot/zImage ../custom-kernels/zImage-tun-m
cp ./drivers/net/tun.ko ../custom-kernels/tun.ko

#build with no tun support and no module support
[ -f .config ] && rm .config
make goldfish_defconfig
grep -v CONFIG_TUN .config > .config2
mv .config2 .config
echo CONFIG_TUN=n >> .config
make
cp arch/arm/boot/zImage ../custom-kernels/zImage-tun-n

