set(PKG_NAME "bzip2")
set(PKG_VERSION "1.0.6")
set(PKG_SHA256 "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "custom")
set(PKG_PATCHES "01-Makefile.patch")

set(PKG_BUILD_COMMAND_TARGET make)
set(PKG_INSTALL_COMMAND_TARGET make install PREFIX=${INSTALL_PREFIX_TARGET})

