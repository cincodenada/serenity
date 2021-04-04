#!/usr/bin/env -S bash ../.port_include.sh
port="OpenRCT2"
version="0.3.3"
files="https://github.com/OpenRCT2/OpenRCT2/archive/refs/tags/v${version}.tar.gz OpenRCT2-${version}.tar.gz"
depends="SDL2 openssl"
configopts="-DCMAKE_TOOLCHAIN_FILE=$SERENITY_ROOT/Toolchain/CMakeToolchain.txt
    -DENABLE_SCRIPTING=OFF
    -DDISABLE_NETWORK=ON
    -DDISABLE_HTTP=ON
    -DDISABLE_GUI=ON
    -DDISABLE_TTF=ON
    -DDISABLE_DISCORD_RPC=ON
    -DDISABLE_GOOGLE_BENCHMARK=ON
    -DENABLE_LIGHTFX=OFF
"
workdir=${port}-${version}

build() {
    run mkdir build
    run cmake . $configopts -B build
    run make
}
