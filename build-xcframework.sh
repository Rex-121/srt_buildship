#!/bin/bash


build_xcfamework() {

cp module.modulemap Includes/module.modulemap
cp ./build/ios/OS/version.h Includes/version.h

rm -rf libsrt.xcframework
# xcodebuild -create-xcframework \
#     -library ./build/ios/_SIMULATOR/libsrt.a -headers Includes \
#     -library ./build/ios/_OS/libsrt.a -headers Includes \
#     -output libsrt.xcframework
xcodebuild -create-xcframework \
    -library ./build/ios/_OS/libsrt.a -headers Includes \
    -output libsrt.xcframework
}

sh ./openssl.sh

sh ./build-ios.sh

build_xcfamework


# cp module.modulemap Includes/module.modulemap
# cp ./build/ios/OS/version.h Includes/version.h

# rm -rf libsrt.xcframework
# xcodebuild -create-xcframework \
#     -library ./build/ios/_SIMULATOR64/libsrt.a -headers Includes \
#     -library ./build/ios/_OS/libsrt.a -headers Includes \
#     -library ./build/visionos/_SIMULATOR/libsrt.a -headers Includes \
#     -library ./build/visionos/_OS/libsrt.a -headers Includes \
#     -library ./build/tvos/_SIMULATOR/libsrt.a -headers Includes \
#     -library ./build/tvos/_OS/libsrt.a -headers Includes \
#     -library ./build/macosx/libsrt.a -headers Includes \
#     -output libsrt.xcframework