set(PKG_NAME "libzip")
set(PKG_VERSION "1.6.1")
set(PKG_SHA256 "06eb8e9141fd19e2788cabaea9c9c2fd4d488d9e1484eb474bbfcac78e7b1d88")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "bzip2"
                       "gnutls"
                       "zlib")
set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_TARGET "-DBUILD_DOC=OFF"
                          "-DBUILD_EXAMPLES=OFF"
                          "-DBUILD_REGRESS=OFF"
                          "-DBUILD_SHARED_LIBS=OFF"
                          "-DBUILD_TOOLS=OFF")

