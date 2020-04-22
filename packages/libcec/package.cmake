set(PKG_NAME "libcec")
set(PKG_VERSION "4.0.4")
set(PKG_SHA256 "4382a964bf8c511c22c03cdab5ba2d81c241536e6479072a61516966804f400a")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "p8-platform")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-remove_git_info.patch")

set(PKG_CMAKE_OPTS_TARGET "-DBUILD_SHARED_LIBS=ON"
                          "-DSKIP_PYTHON_WRAPPER=ON"
                          "-DCMAKE_INSTALL_LIBDIR=${INSTALL_PREFIX_TARGET}/lib"
                          "-DCMAKE_PLATFORM_NO_VERSIONED_SONAME=ON")

