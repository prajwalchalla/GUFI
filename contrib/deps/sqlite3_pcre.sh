#!/usr/bin/env bash
# build and install sqlite3-pcre

set -e

# install sqlite3 first
${SCRIPT_PATH}/sqlite3.sh

# Assume all paths exist

pcre_name="sqlite3-pcre"
pcre_prefix="${INSTALL}/${pcre_name}"
if [[ ! -d "${pcre_prefix}" ]]; then
    export PKG_CONFIG_PATH="${INSTALL}/sqlite3/lib/pkgconfig:${PKG_CONFIG_PATH}"
    pcre_build="${BUILD}/sqlite3-pcre-master"
    if [[ ! -d "${build}" ]]; then
        pcre_tarball="${DOWNLOAD}/sqlite3-pcre.tar.gz"
        if [[ ! -f "${pcre_tarball}" ]]; then
            wget https://github.com/mar-file-system/sqlite3-pcre/archive/master.tar.gz -O "${tarball}"
        fi
    fi

    if [[ ! -d "${pcre_build}" ]]; then
        tar -xf "${pcre_tarball}" -C "${BUILD}"
    fi

    cd "${pcre_build}"
    mkdir -p build
    cd build
    if [[ ! -f Makefile ]]; then
        cmake .. -DCMAKE_INSTALL_PREFIX="${pcre_prefix}"
    fi
    make
    make install
fi
