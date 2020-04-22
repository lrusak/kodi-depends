set(PKG_NAME "meson")
set(PKG_VERSION "0.51.0")
set(PKG_SHA256 "2f75fdf6d586d3595c03a07afcd0eaae11f68dd33fea5906a434d22a409ed63f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "Python")
set(PKG_TOOLCHAIN "custom")

set(PKG_CONFIGURE_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py config)
set(PKG_BUILD_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py build)
set(PKG_INSTALL_COMMAND_HOST ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_HOST})

