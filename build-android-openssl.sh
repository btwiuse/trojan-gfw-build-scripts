#!/bin/bash

# export PATH=/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/:$PATH
export ANDROID_NDK="/opt/android-sdk/ndk/21.0.6113669"
export ANDROID_NDK_HOME="${ANDROID_NDK}"
export PATH="${ANDROID_NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin/:${PATH}"

OPENSSL_VERSION="1.1.1f"

CWD="$(dirname $(realpath $0))/android-openssl"
TROJAN="$(dirname "$CWD")"
mkdir -p "$CWD/build"

cd "$CWD/build"
if [[ ! -f openssl-$OPENSSL_VERSION.tar.gz ]];then
  wget https://openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz
fi
if ! [[ -d openssl-$OPENSSL_VERSION ]];then
  tar xf openssl-$OPENSSL_VERSION.tar.gz
  make -C openssl-$OPENSSL_VERSION distclean
  ./openssl-$OPENSSL_VERSION/Configure android-x86_64 -D__ANDROID_API__=21 no-shared no-ssl2 no-ssl3 no-unit-test --prefix="$CWD/out"
else
  # assume src is already configured and is ready to make
  : rm -rf openssl-$OPENSSL_VERSION
fi

cd "openssl-$OPENSSL_VERSION"
make depend
make
make install_sw
cd "$CWD/out"
install -Dvm644 include/openssl/opensslconf.h $TROJAN/igniter/app/src/main/cpp/libs/lib/x86_64/openssl/opensslconf.h
install -Dvm644 lib/libcrypto.a $TROJAN/igniter/app/src/main/cpp/libs/lib/x86_64/libcrypto.a
install -Dvm644 lib/libssl.a $TROJAN/igniter/app/src/main/cpp/libs/lib/x86_64/libssl.a
