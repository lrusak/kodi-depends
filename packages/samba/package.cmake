set(PKG_NAME "samba")
set(PKG_DEPENDS_TARGET "gnutls"
                       "heimdal-host")
set(PKG_TOOLCHAIN "custom")

if(ENABLE_GPLV3)
  set(PKG_VERSION "4.11.6")
  set(PKG_SHA256 "91438f4d7b71f673421435fa7f26b03b613f214139636ce50af35bc2ff09ef38")
  set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
  set(PKG_PATCHES "01-fix-dependencies.patch"
                  "02-cross_compile.patch"
                  "03-builtin-heimdal.patch"
                  "04-built-static.patch")

  if(CORE_SYSTEM_NAME STREQUAL android)
    list(APPEND PKG_PATCHES "05-samba_android.patch")
  elseif(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
    list(APPEND PKG_PATCHES "05-no_fork_and_exec.patch"
                            "06-crt_extensions.patch")
  endif()

  set(PKG_CONFIGURE_OPTS_TARGET "--prefix=${INSTALL_PREFIX_TARGET}"
                                "--cross-compile"
                                "--cross-answers=cross-answers.txt"
                                "--without-cluster-support"
                                "--without-ldap"
                                "--without-pam"
                                "--enable-fhs"
                                "--without-winbind"
                                "--disable-cups"
                                "--without-ads"
                                "--disable-avahi"
                                "--without-gettext"
                                "--without-dnsupdate"
                                "--without-ad-dc"
                                "--without-acl-support"
                                "--without-utmp"
                                "--disable-iprint"
                                "--nopyc"
                                "--nopyo"
                                "--builtin-libraries=!smbclient,!smbd_base,!smbstatus,ALL"
                                "--disable-python"
                                "--disable-symbol-versions"
                                "--without-json"
                                "--without-libarchive"
                                "--without-regedit")

  set(PKG_CONFIGURE_COMMAND_TARGET ./configure ${PKG_CONFIGURE_OPTS_TARGET})

  set(PKG_BUILD_COMMAND_TARGET WAF_MAKE=1 ./buildtools/bin/waf -v --targets=smbclient)

  # todo: samba actually compiles during the install step - fix ???
  set(PKG_INSTALL_COMMAND_TARGET WAF_MAKE=1 ./buildtools/bin/waf install --targets=smbclient)

  set(PKG_POST_INSTALL_COMMAND_TARGET "install -v bin/default/source3/libsmb/libsmbclient.a ${INSTALL_PREFIX_TARGET}/lib")

else()
  set(PKG_VERSION "3.0.37")
  set(PKG_SHA256 "bb67c0e13d4ccbd84b9200c8739393fdd9b3145b5aad216934dc670f0fcea266")
  set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
  set(PKG_PATCHES "01-samba30-3.0.37-configure.in.patch"
                  "02-samba30-3.0.37-CVE-2010-2063.patch"
                  "03-samba30-3.0.37-silence-receive-warning.patch"
                  "04-samba30-3.0.37-vfs_default.c.patch"
                  "05-samba30-3.0.37-wle-fix.patch"
                  "06-samba_android.patch")

  set(PKG_CONFIGURE_OPTS_TARGET "SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=true"
                                "--prefix=${INSTALL_PREFIX_TARGET}"
                                "--build=${WITH_HOST}"
                                "--host=${WITH_TARGET}"
                                "--disable-cups"
                                "--enable-static"
                                "--disable-shared"
                                "--disable-pie"
                                "--disable-iprint"
                                "--disable-fam"
                                "--without-cluster-support"
                                "--without-cifsupcall"
                                "--without-ads"
                                "--without-ldap"
                                "--with-included-popt"
                                "--with-included-iniparser"
                                "--without-sys-quotas"
                                "--without-krb5"
                                "--without-automount"
                                "--without-sendfile-support"
                                "--with-libiconv=${INSTALL_PREFIX_TARGET}"
                                "--without-cifsmount"
                                "--without-winbind")

  set(PKG_CONFIGURE_COMMAND_TARGET cd source &&
                                  ./autogen.sh &&
                                  ./configure ${PKG_CONFIGURE_OPTS_TARGET})

  set(PKG_BUILD_COMMAND_TARGET $(MAKE) -C source headers &&
                               mkdir -p source/bin &&
                               $(MAKE) -C source libsmbclient)

  set(PKG_INSTALL_COMMAND_TARGET $(MAKE) -C source installclientlib)

endif()

