
#
# Copyright © 2018 Moxa Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# General CMAKE cross compile settings
SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_VERSION 1)

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
