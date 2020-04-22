set(PKG_NAME "libjpeg-turbo")
set(PKG_VERSION "2.0.4")
set(PKG_SHA256 "33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "yasm")
set(PKG_DEPENDS_TARGET "yasm-host")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-disable-executables.patch"
                "02-fix-gas-preprocessor-with-ccache.patch")

set(PKG_CMAKE_OPTS_HOST "-DCMAKE_ASM_NASM_COMPILER=${INSTALL_PREFIX_HOST}/bin/yasm"
                        "-DENABLE_SHARED=OFF"
                        "-DWITH_JPEG8=ON")

set(PKG_CMAKE_OPTS_TARGET ${PKG_CMAKE_OPTS_HOST})

