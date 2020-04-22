set(PKG_NAME "fmt")
set(PKG_VERSION "6.1.2")
set(PKG_SHA256 "1cafc80701b746085dddf41bd9193e6d35089e1c6ec1940e037fcb9c98f62365")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_HOST "-DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD}"
                        "-DCMAKE_CXX_EXTENSIONS=${CMAKE_CXX_EXTENSIONS}"
                        "-DFMT_DOC=OFF"
                        "-DFMT_INSTALL=ON"
                        "-DFMT_TEST=OFF")

set(PKG_CMAKE_OPTS_TARGET ${PKG_CMAKE_OPTS_HOST})

