#!/bin/bash

set -e

toolchain_version=clang

test_ndk_build() {
    local abi="${1}"
    local platform="${2}"
    local outdir="out/ndk_${abi}"

    rm -rf "${outdir}"

    ndk-build V=1 \
        NDK_LIBS_OUT="${outdir}/libs" \
        NDK_OUT="${outdir}/obj" \
        NDK_PROJECT_PATH=. \
        NDK_TOOLCHAIN_VERSION="${toolchain_version}" \
        APP_BUILD_SCRIPT=Android.mk \
        APP_PLATFORM="${platform}" \
        APP_ABI="${abi}"
}

for platform in android-{24,23,22,21}; do
    echo "--- Testing ${platform} ---"
    test_ndk_build armeabi-v7a "${platform}"
done
