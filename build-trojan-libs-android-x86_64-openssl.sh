#!/bin/bash

# export PATH=/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH
export ANDROID_NDK=/opt/android-sdk/ndk/20.0.5594570
export PATH="/opt/android-sdk/ndk/20.0.5594570/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH"

OPENSSL_VERSION=1.1.1f

CWD=$PWD
mkdir -p $CWD/build

cd $CWD/build
if [ ! -f openssl-$OPENSSL_VERSION.tar.gz ];then
wget https://openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz
fi
if [ -d openssl-$OPENSSL_VERSION.tar.gz ];then
rm -rf openssl-$OPENSSL_VERSION.tar.gz
fi
tar xf openssl-$OPENSSL_VERSION.tar.gz
cd openssl-$OPENSSL_VERSION

make clean
./Configure android-x86_64 -D__ANDROID_API__=21 no-shared no-ssl2 no-ssl3 no-unit-test --prefix=$CWD/out
# ./Configure android --prefix=$CWD/build no--shared no-ssl2 no-ssl3 no-hw no-asm no-unit-test
make depend
make
make install_sw
cd $CWD
