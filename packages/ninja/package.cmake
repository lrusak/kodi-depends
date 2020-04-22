set(PKG_NAME "ninja")
set(PKG_VERSION "1.9.0")
set(PKG_SHA256 "5d7ec75828f8d3fd1a0c2f31b5b0cea780cdfe1031359228c428c1a48bfcd5b9")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "Python")
set(PKG_TOOLCHAIN "custom")

set(PKG_BUILD_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 configure.py --bootstrap)
set(PKG_INSTALL_COMMAND_HOST install -v ninja ${INSTALL_PREFIX_HOST}/bin)

