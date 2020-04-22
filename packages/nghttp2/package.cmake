set(PKG_NAME "nghttp2")
set(PKG_VERSION "1.35.1")
set(PKG_SHA256 "9b7f5b09c3ca40a46118240bf476a5babf4bd93a1e4fde2337c308c4c5c3263a")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--enable-lib-only"
                              "--disable-shared")

