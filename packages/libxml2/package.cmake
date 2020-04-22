set(PKG_NAME "libxml2")
set(PKG_VERSION "2.9.4")
set(PKG_SHA256 "ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-disable-tests.patch")

set(PKG_CONFIGURE_OPTS_TARGET "--without-python"
                              "--without-iconv"
                              "--disable-shared")

