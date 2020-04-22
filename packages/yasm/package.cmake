set(PKG_NAME "yasm")
set(PKG_VERSION "1.3.0")
set(PKG_SHA256 "3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_HOST "--disable-nls"
                            "--disable-python")

