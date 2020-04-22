set(PKG_NAME "libudfread")
set(PKG_VERSION "1.0.0")
set(PKG_SHA256 "539dd69d2f43816a2a3f69b77fae05268c3930650c2d0d5b092614cce853583c")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "--disable-shared"
                            "--enable-static")

set(PKG_CONFIGURE_OPTS_TARGET ${PKG_CONFIGURE_OPTS_HOST})
