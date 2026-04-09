
rm -rfv dylibs/*
cargo build --release
mkdir -p dylibs/ && ls target/release/ && cp -v target/release/*.* dylibs/
if [ "$(uname)" = "Darwin" ]; then
  install_name_tool -id @rpath/libcalcit_std.dylib dylibs/libcalcit_std.dylib
fi
