set(PKG_NAME "giflib")
set(PKG_VERSION "5.2.1")
set(PKG_SHA256 "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_TOOLCHAIN "custom")
set(PKG_PATCHES "01-static-lib.patch")

set(PKG_BUILD_COMMAND_HOST $(MAKE) libgif.a)

set(PKG_INSTALL_COMMAND_HOST $(MAKE) install-include install-lib PREFIX=${INSTALL_PREFIX_HOST})

