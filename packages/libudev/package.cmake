set(PKG_NAME "libudev")
set(PKG_VERSION "3.2.5")
set(PKG_SHA256 "870920011285b919fca5c60eaa5670312eeffe3883dd8cf564cd1179fc639336")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--enable-static"
                              "--enable-introspection=no"
                              "--disable-programs"
                              "--disable-blkid"
                              "--disable-selinux"
                              "--disable-manpages"
                              "--disable-kmod"
                              "--disable-mtd_probe")

