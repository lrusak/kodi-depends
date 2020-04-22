set(PKG_NAME "libffi")
set(PKG_VERSION "3.2.1")
set(PKG_SHA256 "d06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-armAssembler.patch"
                "02-fix-include-dir.patch"
                "03-fix-installation-dir.patch"
                "04-fix-pkgconfig.patch")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "--enable-shared")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--enable-static")
