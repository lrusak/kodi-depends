set(PKG_NAME "libxkbcommon")
set(PKG_VERSION "0.8.0")
set(PKG_SHA256 "e829265db04e0aebfb0591b6dc3377b64599558167846c3f5ee5c5e53641fe6d")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--enable-static"
                              "--disable-x11"
                              "--disable-docs")

