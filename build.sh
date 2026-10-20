#!/usr/bin/env bash
set -euo pipefail

cargo build --release --locked
mkdir -p dylibs/
if [ "$(uname)" = "Darwin" ]; then
  cp -v target/release/libcalcit_std.dylib dylibs/
  install_name_tool -id @rpath/libcalcit_std.dylib dylibs/libcalcit_std.dylib
else
  cp -v target/release/libcalcit_std.so dylibs/
fi
