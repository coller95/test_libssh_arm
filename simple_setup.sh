#!/bin/bash
export NVT_CROSS=arm-ca53-linux-gnueabihf-6.4
export CROSS_TOOLCHAIN_PATH=/opt/arm/${NVT_CROSS};
export CROSS_TOOLCHAIN_BIN_PATH=${CROSS_TOOLCHAIN_PATH}/usr/bin
export NVT_HOST=arm-ca53-linux-gnueabihf
export SYSROOT_PATH=${CROSS_TOOLCHAIN_PATH}/usr/${NVT_HOST}/sysroot
export CROSS_COMPILE=${CROSS_TOOLCHAIN_BIN_PATH}/${NVT_HOST}-
export NVT_PRJCFG_CFG="Linux"
export LINUX_BUILD_PATH=${CROSS_TOOLCHAIN_PATH}/bin
export PATH=${CROSS_TOOLCHAIN_BIN_PATH}:${PATH}
export ARCH=arm
export PLATFORM_CFLAGS="-march=armv8-a -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -fno-builtin -fno-common -Wformat=1" 
export CC="${CROSS_COMPILE}gcc"
export CXX="${CROSS_COMPILE}g++"
export CPP="${CROSS_COMPILE}gcc"
export LD=${CROSS_COMPILE}ld
export LDD="${CROSS_COMPILE}ldd --root=${SYSROOT_PATH}"
export AR=${CROSS_COMPILE}ar
export NM=${CROSS_COMPILE}nm
export RANLIB=${CROSS_COMPILE}ranlib
export STRIP=${CROSS_COMPILE}strip
export OBJCOPY=${CROSS_COMPILE}objcopy
export OBJDUMP=${CROSS_COMPILE}objdump
export LD_LIBRARY_PATH=${CROSS_TOOLCHAIN_PATH}/usr/local/lib:${CROSS_TOOLCHAIN_PATH}/lib
