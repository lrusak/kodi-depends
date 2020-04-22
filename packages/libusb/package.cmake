set(PKG_NAME "libusb")
set(PKG_VERSION "0.1.12")
set(PKG_SHA256 "37f6f7d9de74196eb5fc0bbe0aea9b5c939de7f500acba3af6fd643f3b538b44")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-no-Werror.patch")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--disable-build-docs")

