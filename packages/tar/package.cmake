set(PKG_NAME "tar")
set(PKG_VERSION "1.32")
set(PKG_SHA256 "b59549594d91d84ee00c99cf2541a3330fed3a42c440503326dab767f2fbb96c")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain"
                     "xz")
set(PKG_DEPENDS_TARGET "")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "--program-transform-name=s/tar/gtar/"
                            "--disable-dependency-tracking"
                            "ac_cv_func_fdopendir=no"
                            "gl_cv_func_getcwd_abort_bug=no")

