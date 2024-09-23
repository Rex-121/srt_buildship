#!/bin/bash


getopenssl() {

if [ -d $1 ]; then
    echo "文件夹存在：$1"
    rm -rf $1
fi
git clone git@github.com:krzyzanowskim/OpenSSL.git
# git clone https://github.com/x2on/OpenSSL-for-iPhone.git
}

#DIR="./OpenSSL-for-iPhone"
DIR="./OpenSSL"

getopenssl $DIR

#pushd $DIR

#./build-libssl.sh --clean --version=1.1.1k --targets="ios-sim-cross-x86_64 ios-sim-cross-arm64 ios-cross-arm64"

#popd


