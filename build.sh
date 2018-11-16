#!/bin/bash
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


DIR_WRK=$(dirname $(readlink -e $0))

DIR_SDK=$DIR_WRK/output/sdk_aws
export DIR_ENV=$DIR_WRK/output/env_aws

TOOLCHAIN_FILE=$DIR_WRK/config/toolchain-arm-linux.cmake
SYSROOT=$DIR_ENV/arm-linux-gnueabihf
OPENSSL_INCLUDE_DIR=$SYSROOT/usr/include
OPENSSL_SSL_LIBRARY=$SYSROOT/usr/lib/arm-linux-gnueabihf/libssl.so
OPENSSL_CRYPTO_LIBRARY=$SYSROOT/usr/lib/arm-linux-gnueabihf/libcrypto.so

function sdk_build()
{
    echo "-- Process: $FUNCNAME ..."
    rm -rf $DIR_SDK/build_cmake
    mkdir -p $DIR_SDK/build_cmake
    pushd $DIR_SDK/build_cmake > /dev/null
    cmake ../. \
        -DCMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_FILE \
        -DCMAKE_SYSROOT=$SYSROOT \
        -DOPENSSL_INCLUDE_DIR=$OPENSSL_INCLUDE_DIR \
        -DOPENSSL_SSL_LIBRARY=$OPENSSL_SSL_LIBRARY \
        -DOPENSSL_CRYPTO_LIBRARY=$OPENSSL_CRYPTO_LIBRARY
    make
    popd > /dev/null
    echo "-- Process: $FUNCNAME DONE!!"
}

sdk_build

