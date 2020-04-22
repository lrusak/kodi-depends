set(PKG_NAME "libdvdread")
set(PKG_VERSION "6.0.0-Leia-Alpha-3")
set(PKG_SHA256 "a30b6aa0aad0f2c505bc77948af2d5531a80b6e68112addb4c123fca24d5d3bf")
set(PKG_URL "https://github.com/xbmc/libdvdread/archive/${PKG_VERSION}.tar.gz")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "libdvdcss")
set(PKG_DEPENDS_TARGET "libdvdcss")
set(PKG_TOOLCHAIN "autotools")
set(PKG_AUTORECONF ON)

set(PKG_BUILD_CFLAGS_HOST "-D_XBMC -DHAVE_DVDCSS_DVDCSS_H")

if(CORE_SYSTEM_NAME STREQUAL osx OR CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_BUILD_CFLAGS_HOST "-D__DARWIN__")
endif()

set(PKG_BUILD_CFLAGS_TARGET ${PKG_BUILD_CFLAGS_HOST})

set(PKG_CONFIGURE_OPTS_SHARED "--disable-shared"
                              "--enable-static"
                              "--with-pic"
                              "--with-libdvdcss")

set(PKG_CONFIGURE_OPTS_HOST "CSS_LIBS=${INSTALL_PREFIX_HOST}/lib/libdvdcss.la"
                            "CSS_CFLAGS=-I${INSTALL_PREFIX_HOST}/include"
                            ${PKG_CONFIGURE_OPTS_SHARED})

set(PKG_CONFIGURE_OPTS_TARGET ${PKG_CONFIGURE_OPTS_SHARED})
