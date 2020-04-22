set(PKG_NAME "gettext")
set(PKG_VERSION "0.19.8")
set(PKG_SHA256 "3da4f6bd79685648ecf46dab51d66fcdddc156f41ed07e580a696a38ac61d48f")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "libiconv")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-gettext-tools-stpncpy.patch")

# todo: sed patches

set(PKG_CONFIGURE_OPTS_SHARED "--disable-csharp"
                              "--disable-native-java"
                              "--disable-java"
                              "--without-emacs"
                              "--disable-libasprintf"
                              "--disable-openmp"
                              "--with-included-gettext"
                              "--with-included-glib"
                              "--with-included-libcroco"
                              "--with-included-libxml"
                              "--without-git"
                              "--without-cvs"
                              "--disable-shared"
                              "--disable-curses")

set(PKG_CONFIGURE_OPTS_HOST ${PKG_CONFIGURE_OPTS_SHARED}
                            "--disable-acl"
                            "--disable-c++"
                            "--disable-nls")

set(PKG_MAKE_OPTS_HOST -C gettext-tools)
set(PKG_MAKE_INSTALL_OPTS_HOST -C gettext-tools install)

set(PKG_CONFIGURE_OPTS_TARGET ${PKG_CONFIGURE_OPTS_SHARED})

set(PKG_MAKE_OPTS_TARGET -C gettext-runtime)
set(PKG_MAKE_INSTALL_OPTS_TARGET -C gettext-runtime install)

