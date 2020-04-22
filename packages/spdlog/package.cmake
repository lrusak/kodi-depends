set(PKG_NAME "spdlog")
set(PKG_VERSION "1.5.0")
set(PKG_SHA256 "b38e0bbef7faac2b82fed550a0c19b0d4e7f6737d5321d4fd8f216b80f8aee8a")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "fmt")
set(PKG_DEPENDS_TARGET "fmt")
set(PKG_TOOLCHAIN "cmake")

set(PKG_CMAKE_OPTS_HOST "-DSPDLOG_BUILD_EXAMPLE=OFF"
                        "-DSPDLOG_BUILD_TESTS=OFF"
                        "-DSPDLOG_BUILD_BENCH=OFF"
                        "-DSPDLOG_INSTALL=ON"
                        "-DSPDLOG_FMT_EXTERNAL=ON")

set(PKG_CMAKE_OPTS_TARGET ${PKG_CMAKE_OPTS_HOST})

