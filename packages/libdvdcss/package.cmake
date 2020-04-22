set(PKG_NAME "libdvdcss")
set(PKG_VERSION "1.4.2-Leia-Beta-5")
set(PKG_SHA256 "38816f8373e243bc5950449b4f3b18938c4e1c59348e3411e23f31db4072e40d")
set(PKG_URL "https://github.com/xbmc/libdvdcss/archive/${PKG_VERSION}.tar.gz")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "--disable-shared"
                            "--enable-static"
                            "--with-pic")

set(PKG_CONFIGURE_OPTS_TARGET ${PKG_CONFIGURE_OPTS_HOST})

