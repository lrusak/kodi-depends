set(PKG_NAME "libxslt")
set(PKG_VERSION "1.1.29")
set(PKG_SHA256 "b5976e3857837e7617b29f2249ebb5eeac34e249208d31f1fbf7a6ba7a4090ce")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "libgcrypt"
                       "libxml2")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-all-disable-tests-docs.patch")

set(PKG_CONFIGURE_OPTS_TARGET "--without-python"
                              "--disable-shared"
                              "--with-debug"
                              "--with-debugger"
                              "--with-mem-debug"
                              "--with-libxml-prefix=${INSTALL_PREFIX_TARGET}")

