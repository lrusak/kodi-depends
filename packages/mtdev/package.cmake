set(PKG_NAME "mtdev")
set(PKG_VERSION "1.1.5")
set(PKG_SHA256 "6677d5708a7948840de734d8b4675d5980d4561171c5a8e89e54adf7a13eba7f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--enable-static"
                              "--disable-shared")

