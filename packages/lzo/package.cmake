set(PKG_NAME "lzo")
set(PKG_VERSION "2.09")
set(PKG_SHA256 "f294a7ced313063c057c504257f437c8335c41bfeed23531ee4e6a2b87bcb34c")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_HOST "--enable-shared")

