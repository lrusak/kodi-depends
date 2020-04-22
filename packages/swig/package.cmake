set(PKG_NAME "swig")
set(PKG_VERSION "4.0.0")
set(PKG_SHA256 "e8a39cd6437e342cdcbd5af27a9bf11b62dc9efec9248065debcb8276fcbb925")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "pcre")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_HOST "--without-alllang"
                            "--without-x"
                            "--disable-ccache")

