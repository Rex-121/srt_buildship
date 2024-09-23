#!/bin/bash

srt_ios() {
  #IOS_OPENSSL=$(pwd)/OpenSSL/$1

  # export IOS_OPENSSL=$3

  mkdir -p ./build/ios/$2
  pushd ./build/ios/$2
  ../../../../srt/configure \
  --cmake-prefix-path=$3 \
  --ios-platform=$2 \
  --ios-arch=arm64 \
  --cmake-toolchain-file=scripts/iOS.cmake \
  --USE_OPENSSL_PC=off
  # --ios-disable-bitcode=1
  make
  popd
  
}

srt_iossimulator() {
  #IOS_OPENSSL=$(pwd)/OpenSSL/$1

  #export IOS_OPENSSL=$4
  OS=$2
  ARM=$3
  OPENSSL=$4

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

  # mkdir -p ./build/ios/_$OS

  # libtool -static -o ./build/ios/_$OS/libsrt.a \
  # ./build/ios/$OS/libsrt.a \
  # $4/lib/libcrypto.a \
  # $4/lib/libssl.a
}


getsrt() {

if [ -d $1 ]; then
    echo "文件夹存在：$1"
    rm -rf $1
fi

git clone https://github.com/Haivision/srt.git
}
OPENSSL="$(pwd)/OpenSSL"
SRTDIR="./srt"

echo $OPENSSL

# iOS
export IPHONEOS_DEPLOYMENT_TARGET=15.0
SDKVERSION=$(xcrun --sdk iphoneos --show-sdk-version)

#getsrt $SRTDIR

sh ./build-srt.sh iphonesimulator SIMULATOR x86_64 "$OPENSSL/iPhoneSimulator$SDKVERSION-x86_64.sdk"

sh ./build-srt.sh iphoneos OS arm64 "$OPENSSL/iphoneos"

#srt_ios iphoneos OS "$OPENSSL/iPhoneOS$SDKVERSION-arm64.sdk"
# mkdir -p ./build/ios/_SIMULATOR64
# libtool -static -o ./build/ios/_SIMULATOR64/libsrt.a ./build/ios/SIMULATOR64/libsrt.a ./OpenSSL/iphonesimulator/lib/libcrypto.a ./OpenSSL/iphonesimulator/lib/libssl.a
# mkdir -p ./build/ios/_OS
# libtool -static -o ./build/ios/_OS/libsrt.a ./build/ios/OS/libsrt.a /Users/tyrant/ffmpeg/OpenSSL-for-iPhone-master/bin/iPhoneOS17.5-arm64.sdk/lib/libcrypto.a /Users/tyrant/ffmpeg/OpenSSL-for-iPhone-master/bin/iPhoneOS17.5-arm64.sdk/lib/libssl.a




# #!/bin/bash

# srt_ios() {
#   #IOS_OPENSSL=$(pwd)/OpenSSL/$1

#   mkdir -p ./build/ios/$2
#   pushd ./build/ios/$2
#   ../../../../srt/configure --cmake-prefix-path=$IOS_OPENSSL --ios-disable-bitcode=1 --ios-platform=$2 --ios-arch=arm64 --cmake-toolchain-file=scripts/iOS.cmake --USE_OPENSSL_PC=off
#   make
#   popd
# }

# # iOS
# export IPHONEOS_DEPLOYMENT_TARGET=13.0
# SDKVERSION=$(xcrun --sdk iphoneos --show-sdk-version)
# #srt_ios iphonesimulator SIMULATOR64
# srt_ios iphoneos OS
# #mkdir -p ./build/ios/_SIMULATOR64
# #libtool -static -o ./build/ios/_SIMULATOR64/libsrt.a ./build/ios/SIMULATOR64/libsrt.a ./OpenSSL/iphonesimulator/lib/libcrypto.a ./OpenSSL/iphonesimulator/lib/libssl.a
# mkdir -p ./build/ios/_OS
# libtool -static -o ./build/ios/_OS/libsrt.a ./build/ios/OS/libsrt.a /Users/tyrant/ffmpeg/OpenSSL-for-iPhone-master/bin/iPhoneOS17.5-arm64.sdk/lib/libcrypto.a /Users/tyrant/ffmpeg/OpenSSL-for-iPhone-master/bin/iPhoneOS17.5-arm64.sdk/lib/libssl.a

