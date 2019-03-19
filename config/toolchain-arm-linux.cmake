# Copyright (C) 2019 Moxa Inc. All rights reserved.
# SPDX-License-Identifier: Apache-2.0

# General CMAKE cross compile settings
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

# This is the iothinxio include folder
SET(IOTHINXIO_INC_DIR $ENV{DIR_ENV}/arm-linux-gnueabihf/libc/usr/include)

# This is the iothinxio library folder
SET(IOTHINXIO_LIB_DIR $ENV{DIR_ENV}/arm-linux-gnueabihf/libc/usr/lib/iothinx)

# Specify toolchain directory
SET(TOOLCHAIN_DIR $ENV{DIR_ENV}/bin)

# Specify cross compilation target
SET(TARGET_CROSS arm-linux-gnueabihf-)

# Set compilers
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_DIR}/${TARGET_CROSS}g++)

# Set linker
SET(CMAKE_LINKER ${TOOLCHAIN_DIR}/${TARGET_CROSS}ld)

# Set compiler flags
SET(CMAKE_CXX_FLAGS ${COMMON_FLAGS} -std=c++11)

# Set archiving tool
SET(CMAKE_AR ${TOOLCHAIN_DIR}/${TARGET_CROSS}ar CACHE FILEPATH "Archiver")

# Set randomizing tool for static libraries
SET(CMAKE_RANLIB ${TOOLCHAIN_DIR}/${TARGET_CROSS}ranlib)

# Set strip tool
SET(CMAKE_STRIP ${TOOLCHAIN_DIR}/${TARGET_CROSS}strip)

# Set objdump tool
SET(CMAKE_OBJDUMP ${TOOLCHAIN_DIR}/${TARGET_CROSS}objdump)

# Set objcopy tool
SET(CMAKE_OBJCOPY ${TOOLCHAIN_DIR}/${TARGET_CROSS}objcopy)

# Set nm tool
SET(CMAKE_NM ${TOOLCHAIN_DIR}/${TARGET_CROSS}nm)

# Set THREADS_PTHREAD_ARG for testing threading
SET(THREADS_PTHREAD_ARG "2" CACHE STRING "Forcibly set by toolchain-arm-linux.cmake." FORCE)
