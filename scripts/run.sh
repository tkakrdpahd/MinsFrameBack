#!/usr/bin/env bash
set -euo pipefail

need() { command -v "$1" >/dev/null || { echo "$1 not found. Install with: brew install $1"; exit 1; }; }
need cmake
need ninja
need autoconf
need automake
need libtool
need pkg-config
need git

git submodule update --init --recursive

if [[ ! -x externals/vcpkg/vcpkg ]]; then
  echo "Bootstrapping vcpkg..."
  ./externals/vcpkg/bootstrap-vcpkg.sh
fi

export VCPKG_ROOT="$(pwd)/externals/vcpkg"
echo "VCPKG_ROOT=$VCPKG_ROOT"

cmake --preset default
cmake --build build -j"$(sysctl -n hw.logicalcpu)"

echo "Running binary:"
./build/minsframe
