set(PKG_NAME "rapidjson")
set(PKG_VERSION "1.1.0")
set(PKG_SHA256 "bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-remove_custom_cxx_flags.patch")

set(PKG_CMAKE_OPTS_HOST "-DRAPIDJSON_HAS_STDSTRING=ON"
                        "-DRAPIDJSON_BUILD_DOC=OFF"
                        "-DRAPIDJSON_BUILD_EXAMPLES=OFF"
                        "-DRAPIDJSON_BUILD_TESTS=OFF"
                        "-DRAPIDJSON_BUILD_THIRDPARTY_GTEST=OFF")

set(PKG_CMAKE_OPTS_TARGET ${PKG_CMAKE_OPTS_HOST})

