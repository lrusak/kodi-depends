set(PKG_NAME "libdvdnav")
set(PKG_VERSION "6.0.0-Leia-Alpha-3")
set(PKG_SHA256 "071e414e61b795f2ff9015b21a85fc009dde967f27780d23092643916538a57a")
set(PKG_URL "https://github.com/xbmc/libdvdnav/archive/${PKG_VERSION}.tar.gz")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "libdvdread")
set(PKG_DEPENDS_TARGET "libdvdread")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_BUILD_CFLAGS_HOST "-D_XBMC -DHAVE_DVDCSS_DVDCSS_H")

if(CORE_SYSTEM_NAME STREQUAL osx OR CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_BUILD_CFLAGS_HOST "-D__DARWIN__")
endif()

set(PKG_BUILD_CFLAGS_TARGET "${PKG_BUILD_CFLAGS_HOST}")

set(PKG_CONFIGURE_OPTS_SHARED "--disable-shared"
                              "--enable-static"
                              "--with-pic")

set(PKG_CONFIGURE_OPTS_HOST "DVDREAD_LIBS=${INSTALL_PREFIX_HOST}/lib/libdvdread.la"
                            "DVDREAD_CFLAGS=-I${INSTALL_PREFIX_HOST}/include"
                            ${PKG_CONFIGURE_OPTS_SHARED})

set(PKG_CONFIGURE_OPTS_TARGET ${PKG_CONFIGURE_OPTS_SHARED})
