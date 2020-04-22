set(PKG_NAME "libmicrohttpd")
set(PKG_VERSION "0.9.55")
set(PKG_SHA256 "0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada80ed0f8")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "gnutls"
                       "libgcrypt"
                       "libgpg-error")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--disable-doc"
                              "--disable-examples"
                              "--disable-curl"
                              "--disable-spdy")

