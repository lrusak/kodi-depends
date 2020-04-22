set(PKG_NAME "libass")
set(PKG_VERSION "0.13.4")
set(PKG_SHA256 "6711469df5fcc47d06e92f7383dcebcf1282591002d2356057997e8936840792")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "fontconfig"
                       "fribidi"
                       "libpng"
                       "freetype2"
                       "expat"
                       "libiconv")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--disable-enca")

