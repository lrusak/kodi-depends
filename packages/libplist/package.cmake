set(PKG_NAME "libplist")
set(PKG_VERSION "2.0.0")
set(PKG_SHA256 "3a7e9694c2d9a85174ba1fa92417cfabaea7f6d19631e544948dc7e17e82f602")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-disable-tools-tests.patch")
set(PKG_AUTORECONF ON)

# todo: cflags ????

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--without-cython")

