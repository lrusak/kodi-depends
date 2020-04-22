set(PKG_NAME "distutilscross")
set(PKG_VERSION "0.1")
set(PKG_SHA256 "4ed3fb427708c8a3ed5fe9c599532480f581078a1e0aec0e50f40eb58e9f0015")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "Python")
set(PKG_TOOLCHAIN "custom")
set(PKG_PATCHES "01-python3.patch")

set(PKG_INSTALL_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_HOST})

