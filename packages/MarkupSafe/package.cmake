set(PKG_NAME "MarkupSafe")
set(PKG_VERSION "1.0")
set(PKG_SHA256 "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://files.pythonhosted.org/packages/source/M/${PKG_NAME}/${PKG_ARCHIVE}")
set(PKG_DEPENDS_HOST "Python"
                     "setuptools")
set(PKG_TOOLCHAIN "custom")

set(PKG_INSTALL_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_HOST})

