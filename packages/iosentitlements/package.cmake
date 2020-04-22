set(PKG_NAME "iosentitlements")
set(PKG_VERSION "1.0.0")
set(PKG_SHA256 "9ad2d1a278420d16d987efb7431cfc38eb799e378d7ad8fb05a7b526969c7467")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "custom")

set(PKG_INSTALL_COMMAND_TARGET mkdir -p ${INSTALL_PREFIX_TARGET}/share && cp -f ios11_entitlements.xml ${INSTALL_PREFIX_TARGET}/share)
