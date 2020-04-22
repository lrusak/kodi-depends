set(PKG_NAME "heimdal")
set(PKG_VERSION "7.7.0")
set(PKG_SHA256 "f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-hcrypto-fix-includes.patch"
                "02-hxtool-requires-asn-headers.patch")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_HOST "ac_cv_prog_COMPILE_ET=no"
                            "--disable-shared"
                            "--without-openldap"
                            "--without-capng"
                            "--without-sqlite3"
                            "--without-libintl"
                            "--without-openssl"
                            "--without-berkeley-db"
                            "--without-readline"
                            "--without-libedit"
                            "--without-hesiod"
                            "--without-x"
                            "--disable-otp"
                            "--disable-heimdal-documentation")

set(PKG_POST_INSTALL_COMMAND_HOST "install -v lib/asn1/asn1_compile ${INSTALL_PREFIX_HOST}/bin"
                                  "install -v lib/com_err/compile_et ${INSTALL_PREFIX_HOST}/bin")

