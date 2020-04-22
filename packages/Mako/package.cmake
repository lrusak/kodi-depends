set(PKG_NAME "Mako")
set(PKG_VERSION "1.1.1")
set(PKG_SHA256 "2984a6733e1d472796ceef37ad48c26f4a984bb18119bb2dbc37a44d8f6e75a4")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://files.pythonhosted.org/packages/source/M/${PKG_NAME}/${PKG_ARCHIVE}")
set(PKG_DEPENDS_HOST "Python"
                     "setuptools"
                     "MarkupSafe")
set(PKG_TOOLCHAIN "custom")

set(PKG_INSTALL_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_HOST})

