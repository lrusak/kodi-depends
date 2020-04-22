set(PKG_NAME "gas-preprocessor")
set(PKG_VERSION "1.0.0")
set(PKG_SHA256 "3ee764fb17f4a319409588ba65449c9d0fa201328edd9fe176560fe85a0864cd")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_TOOLCHAIN "custom")

set(PKG_INSTALL_COMMAND_HOST mkdir -p ${INSTALL_PREFIX_HOST}/bin && cp -f gas-preprocessor.pl ${INSTALL_PREFIX_HOST}/bin)
