set(PKG_NAME "setuptools")
set(PKG_VERSION "41.0.1")
set(PKG_SHA256 "bd570971d6ad848c263e221eb7855c15da1fa27efdb91568b4e1b8b06b4b8720")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "Python")
set(PKG_DEPENDS_TARGET "Python-host"
                       "Python")
set(PKG_TOOLCHAIN "custom")

set(PKG_BUILD_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 bootstrap.py)
set(PKG_INSTALL_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_HOST})

set(PKG_BUILD_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/python3 bootstrap.py)
set(PKG_INSTALL_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_TARGET})

