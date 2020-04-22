set(PKG_NAME "libtool")
set(PKG_VERSION "2.4.6")
set(PKG_SHA256 "e3bd4d5d3d025a36c21dd6af7ea818a2afcd4dfc1ea5a17b39d7854bcd0c06e3")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "autoconf"
                     "automake")
set(PKG_DEPENDS_TARGET "")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_HOST "--disable-shared"
                            "--disable-ltdl-install")

