set(PKG_NAME "gnutls")
set(PKG_VERSION "3.6.11.1")
set(PKG_SHA256 "fbba12f3db9a55dbf027e14111755817ec44b57eabec3e8089aac8ac6f533cf8")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "toolchain"
                       "nettle"
                       "zlib")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-size-max.patch"
                "02-add-dl-as-private-lib.patch")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--without-p11-kit"
                              "--disable-nls"
                              "--with-included-unistring"
                              "--with-included-libtasn1"
                              "--enable-local-libopts"
                              "--disable-doc"
                              "--disable-tests"
                              "--disable-guile"
                              "--disable-tools")

if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET --disable-hardware-acceleration)
endif()
