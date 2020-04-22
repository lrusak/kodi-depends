set(PKG_NAME "curl")
set(PKG_VERSION "7.68.0")
set(PKG_SHA256 "207f54917dd6a2dc733065ccf18d61bb5bebeaceb5df49cd9445483e8623eeb9")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain"
                       "openssl"
                       "nghttp2")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--disable-ldap"
                              "--without-libssh2"
                              "--disable-ntlm-wb"
                              "--enable-ipv6"
                              "--without-librtmp"
                              "--with-ca-fallback"
                              "--with-ssl=${INSTALL_PREFIX_TARGET}"
                              "--with-nghttp2=${INSTALL_PREFIX_TARGET}")

set(PKG_MAKE_OPTS_TARGET -C lib)

set(PKG_POST_INSTALL_COMMAND_TARGET "$(MAKE) -C include install"
                                    "$(MAKE) install-pkgconfigDATA")



