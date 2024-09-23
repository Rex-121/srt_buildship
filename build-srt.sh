#!/bin/bash


#IOS_OPENSSL=$(pwd)/OpenSSL/$1

  #export IOS_OPENSSL=$4
  OS=$2
  ARM=$3
  OPENSSL=$(pwd)/OpenSSL/$1

  echo "$OPENSSL"

  mkdir -p ./build/ios/$OS
  pushd ./build/ios/$OS
  ../../../../srt/configure \
  --cmake-prefix-path=$OPENSSL \
  --ios-platform=$OS \
  --ios-arch=$ARM \
  --cmake-toolchain-file=scripts/iOS.cmake \
  --USE_OPENSSL_PC=off
    # --ios-disable-bitcode=1 \
  make clean && make
  popd

  mkdir -p ./build/ios/_$OS

  libtool -static -o ./build/ios/_$OS/libsrt.a \
  ./build/ios/$OS/libsrt.a \
  $OPENSSL/lib/libcrypto.a \
  $OPENSSL/lib/libssl.a