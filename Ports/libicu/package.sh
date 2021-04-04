#!/usr/bin/env -S bash ../.port_include.sh
port="libicu"
version="68.2"
dashversion=${version/./-}
files="https://github.com/unicode-org/icu/archive/refs/tags/release-${dashversion}.tar.gz ${port}-${version}.tar.gz
https://github.com/unicode-org/icu/releases/download/release-${dashversion}/icu4c-${version/./_}-Ubuntu20.04-x64.tgz icu4c-host.tgz
"
depends=""
workdir=icu-release-${version/./-}/icu4c/source
useconfigure="true"
configscript="runConfigureICU"
configopts="--with-cross-build ${workdir}/../../../icu"

configure() {
    chmod +x "${workdir}"/"$configscript"
    run ./"$configscript" SerenityOS --host="${SERENITY_ARCH}-pc-serenity" $configopts
}

