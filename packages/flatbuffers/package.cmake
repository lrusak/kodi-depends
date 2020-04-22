set(PKG_NAME "flatbuffers")
set(PKG_VERSION "1.11.0")
set(PKG_SHA256 "1789b97e790da8f2cb5ff827d15580878c8629fd889f5f038d7524dca43eacc9")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_HOST "-DCMAKE_BUILD_TYPE=Release"
                        "-DFLATBUFFERS_CODE_COVERAGE=OFF"
                        "-DFLATBUFFERS_BUILD_TESTS=OFF"
                        "-DFLATBUFFERS_INSTALL=ON"
                        "-DFLATBUFFERS_BUILD_FLATLIB=OFF"
                        "-DFLATBUFFERS_BUILD_FLATC=ON"
                        "-DFLATBUFFERS_BUILD_FLATHASH=OFF"
                        "-DFLATBUFFERS_BUILD_GRPCTEST=OFF"
                        "-DFLATBUFFERS_BUILD_SHAREDLIB=OFF")

set(PKG_CMAKE_OPTS_TARGET ${PKG_CMAKE_OPTS_HOST}
                          "-DFLATBUFFERS_BUILD_FLATC=OFF")

