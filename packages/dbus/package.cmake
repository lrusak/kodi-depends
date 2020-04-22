set(PKG_NAME "dbus")
set(PKG_VERSION "1.11.16")
set(PKG_SHA256 "7cf993e97df62c73b939b77dcd920e8883d8e866f9ced1a9b5c715eb28e4b031")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain"
                       "expat")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--without-x"
                              "--disable-xml-docs"
                              "--disable-doxygen-docs")

