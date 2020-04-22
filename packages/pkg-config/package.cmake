set(PKG_NAME "pkg-config")
set(PKG_VERSION "0.29.2")
set(PKG_SHA256 "6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "gettext")
set(PKG_TOOLCHAIN "autotools")

# todo: sed patches

set(PKG_CONFIGURE_OPTS_HOST "--enable-indirect-deps"
                            "--with-pc-path=${INSTALL_PREFIX_HOST}/lib/pkgconfig:${INSTALL_PREFIX_HOST}/share/pkgconfig"
                            "--with-internal-glib")

