set(PKG_NAME "p8-platform")
set(PKG_VERSION "2.1.0.1")
set(PKG_SHA256 "26ec8361c162895346e70f3ee71d6a97c4a5d69920537cb6e00694116a0cb716")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_TARGET "-DBUILD_SHARED_LIBS=OFF"
                          "-DCMAKE_INSTALL_LIBDIR=${INSTALL_PREFIX_TARGET}/lib")

