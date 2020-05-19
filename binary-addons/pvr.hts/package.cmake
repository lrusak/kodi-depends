set(PKG_NAME "pvr.hts")
set(PKG_VERSION "5.4.8-Matrix")
set(PKG_SHA256 "6abd319e2c16fe2934024962dcab3ba119b72a0a69f9518736262f7c1864babb")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://github.com/kodi-pvr/pvr.hts/archive/${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain"
                       "kodi-platform")

set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_TARGET "-DPACKAGE_ZIP=ON"
                          "-DPACKAGE_DIR=${INSTALL_PREFIX_TARGET}/zips")

set(PKG_MAKE_INSTALL_OPTS_TARGET package)
