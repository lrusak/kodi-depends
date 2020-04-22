set(PKG_NAME "wayland-protocols")
set(PKG_VERSION "1.17")
set(PKG_SHA256 "df1319cf9705643aea9fd16f9056f4e5b2471bd10c0cc3713d4a4cdc23d6812f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_URL "https://wayland.freedesktop.org/releases/${PKG_ARCHIVE}")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--with-noarch-pkgconfigdir=${INSTALL_PREFIX_TARGET}/lib/pkgconfig")
