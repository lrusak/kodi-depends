set(PKG_NAME "fontconfig")
set(PKG_VERSION "2.13.1")
set(PKG_SHA256 "f655dd2a986d7aa97e052261b36aa67b0a64989496361eca8d604e6414006741")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain"
                       "freetype"
                       "expat"
                       "libiconv"
                       "libuuid")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-disable-test.patch"
                "02-lconv.patch"
                "03-fix-aarch64_atomics.patch")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--disable-libxml2"
                              "--disable-docs"
                              "--with-arch=${WITH_TARGET}"
                              "--disable-shared")

