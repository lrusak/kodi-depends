set(PKG_NAME "libinput")
set(PKG_VERSION "1.10.5")
set(PKG_SHA256 "cbb1c03b8fb4b1d3781db5c8c66cdc1e754c0354037bcf39b2d8d08710077b2e")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "meson-host"
                       "ninja-host"
                       "mtdev"
                       "libevdev")
set(PKG_TOOLCHAIN "meson")

set(PKG_MESON_OPTS_TARGET "-Ddebug-gui=false"
                          "-Ddocumentation=false"
                          "-Dlibwacom=false"
                          "-Dtests=false")

