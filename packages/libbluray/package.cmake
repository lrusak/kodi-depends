set(PKG_NAME "libbluray")
set(PKG_VERSION "1.1.2")
set(PKG_SHA256 "a3dd452239b100dc9da0d01b30e1692693e2a332a7d29917bf84bb10ea7c0b42")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain"
                       "fontconfig"
                       "freetype"
                       "libiconv"
                       "libxml2")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

if(CORE_PLATFORM_NAME_LC STREQUAL tvos)
  set(PKG_PATCHES "01-tvos.patch")
endif()

# todo: sed patches

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--exec-prefix=${INSTALL_PREFIX_TARGET}"
                              "--disable-examples"
                              "--disable-doxygen-doc"
                              "--disable-bdjava-jar")

