set(PKG_NAME "wayland")
set(PKG_VERSION "1.17.0")
set(PKG_SHA256 "72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_URL "https://wayland.freedesktop.org/releases/${PKG_ARCHIVE}")
set(PKG_DEPENDS_HOST "toolchain"
                     "expat")
set(PKG_DEPENDS_TARGET "expat"
                       "libffi"
                       "wayland-host")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_HOST "--disable-libraries"
                            "--disable-documentation"
                            "--disable-dtd-validation")

set(PKG_CONFIGURE_OPTS_TARGET "--with-host-scanner"
                              "--disable-documentation"
                              "--disable-dtd-validation")

# hack: not sure if there is a better solution (maybe a newer meson version solves this for mesa)
set(PKG_POST_INSTALL_COMMAND_TARGET "install -v ${INSTALL_PREFIX_HOST}/lib/pkgconfig/wayland-scanner.pc ${INSTALL_PREFIX_TARGET}/lib/pkgconfig/")
