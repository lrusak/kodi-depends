set(PKG_NAME "kodi-platform")
set(PKG_VERSION "809c5e9d711e378561440a896fcb7dbcd009eb3d")
set(PKG_SHA256 "159165ae641da5eb273885ce53b8a4b84e62a595c4974f9d12c1b5d1428ef25c")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://github.com/xbmc/kodi-platform/archive/${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain"
                       "tinyxml"
                       "p8-platform")

set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_TARGET "-DBUILD_SHARED_LIBS=OFF")
