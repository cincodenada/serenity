#!/usr/bin/env -S bash ../.port_include.sh
port="libicu"
version="68.2"
dashversion=${version/./-}
files="https://github.com/unicode-org/icu/releases/download/release-68-2/icu4c-68_2-src.tgz ${port}-${version}.tar.gz"
depends=""
workdir=icu/source
useconfigure="true"
configscript="runConfigureICU"
configopts="--with-cross-build=$(realpath ${workdir}/../../icu-host/build)"

#post_fetch() {
#    # Build the host ICU??
#    # I just do this manually for now
#    if [ ! -d icu-host ]; then
#        cp -r icu icu-host
#        mkdir -p icu-host/build
#        (cd icu-host/build && ../source/runConfigureICU Linux && make)
#    fi
#}

configure() {
    chmod +x "${workdir}"/"$configscript"
    run ./"$configscript" SerenityOS --host="${SERENITY_ARCH}-pc-serenity" $configopts
}

