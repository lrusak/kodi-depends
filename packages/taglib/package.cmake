set(PKG_NAME "taglib")
set(PKG_VERSION "1.11.1")
set(PKG_SHA256 "b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "zlib")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-ID3v2Lookup.patch"
                "02-remove-boost.patch")

set(PKG_CMAKE_OPTS_TARGET "-DBUILD_SHARED_LIBS=OFF")

