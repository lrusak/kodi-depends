set(PKG_NAME "libcdio")
set(PKG_DEPENDS_TARGET "toolchain"
                       "libiconv")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

if(ENABLE_GPLV3)
  set(PKG_VERSION "2.1.0")
  set(PKG_SHA256 "8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b")
  set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
  set(PKG_PATCHES "01-osx.patch"
                  "02-fix-glob-on-android.patch")

  set(PKG_CONFIGURE_OPTS_TARGET "--with-cd-drive=no"
                                "--with-cd-info=no"
                                "--with-cd-paranoia=no"
                                "--with-cdda-player=no"
                                "--with-cd-read=no"
                                "--with-iso-info=no"
                                "--with-iso-read=no"
                                "--disable-example-progs"
                                "--disable-cpp-progs"
                                "--enable-cxx"
                                "--disable-shared")
else()
  # I couldn't get this version to build :/
  set(PKG_VERSION "0.80")
  set(PKG_SHA256 "b1a41a34db5a034649109c3328782e4e2fa438b1e2bddc458cd260f60ef7ca66")
  set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
  set(PKG_PATCHES "01-configure.patch"
                  "02-cross.patch")

  set(PKG_CONFIGURE_OPTS_TARGET "--with-cd-drive=no"
                                "--with-cd-info=no"
                                "--with-cd-paranoia=no"
                                "--with-cdda-player=no"
                                "--with-cd-read=no"
                                "--with-iso-info=no"
                                "--with-iso-read=no"
                                "--disable-example-progs"
                                "--disable-cpp-progs"
                                "--disable-cxx"
                                "--disable-shared")
endif()

