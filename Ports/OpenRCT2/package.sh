#!/usr/bin/env -S bash ../.port_include.sh
port="OpenRCT2"
version="0.3.3"
files="https://github.com/OpenRCT2/OpenRCT2/archive/refs/tags/v${version}.tar.gz OpenRCT2-${version}.tar.gz"
depends="SDL2 cmake"

build() {
    cd $workdir
    mkdir build
    cd build
    cmake ../ -DENABLE_SCRIPTING=OFF
    make
}
