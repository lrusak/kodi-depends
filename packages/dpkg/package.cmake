set(PKG_NAME "dpkg")
set(PKG_VERSION "1.19.7")
set(PKG_SHA256 "4c27fededf620c0aa522fff1a48577ba08144445341257502e7730f2b1a296e8")
set(PKG_ARCHIVE "${PKG_NAME}_${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_HOST "toolchain"
                     "tar")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-no-gnu-patch.patch"
                "02-perl-min-version.patch"
                "03-lzma-compression.patch")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "--enable-static"
                            "--disable-shared"
                            "--disable-devel-docs"
                            "--disable-linker-optimizations"
                            "--disable-nls"
                            "--disable-dselect"
                            "--disable-start-stop-daemon"
                            "ac_cv_header_libintl_h=no")

