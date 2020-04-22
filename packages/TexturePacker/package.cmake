set(PKG_NAME "TexturePacker")
set(PKG_SOURCE_PATH ${WITH_KODI_SOURCE}/tools/depends/native/${PKG_NAME}/src)
set(PKG_DEPENDS_HOST "toolchain"
                     "libpng"
                     "lzo"
                     "giflib"
                     "libjpeg-turbo")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "KODI_SRC_DIR=${WITH_KODI_SOURCE}"
                            "EXTRA_DEFINES=-L${INSTALL_PREFIX_HOST}/lib"
                            "--enable-static")
