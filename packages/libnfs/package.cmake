set(PKG_NAME "libnfs")
set(PKG_VERSION "2.0.0")
set(PKG_SHA256 "7ea6cd8fa6c461d01091e584d424d28e137d23ff4b65b95d01a3fd0ef95d120e")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--disable-utils"
                              "--disable-werror")

