set(PKG_NAME "googletest")
set(PKG_VERSION "1.10.0")
set(PKG_SHA256 "9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_HOST "-DBUILD_GMOCK=OFF"
                        "-DINSTALL_GTEST=ON"
                        "-DBUILD_SHARED_LIBS=OFF")

