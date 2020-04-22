set(PKG_NAME "libiconv")
set(PKG_VERSION "1.15")
set(PKG_SHA256 "ccf536620a45458d26ba83887a983b96827001e92a13847b45e4925cc8913178")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--enable-extra-encodings")

if(APPLE)
  set(PKG_TOOLCHAIN "virtual")
endif()
