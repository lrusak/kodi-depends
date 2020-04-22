set(PKG_NAME "ffmpeg")
set(PKG_VERSION "4.2.2-Matrix-Alpha1")
set(PKG_SHA256 "0dba571f9809588cfbdc29d6a551dab4cd5736701653d9263847c9ac67bcde86")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://github.com/xbmc/FFmpeg/archive/${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "dav1d")
set(PKG_DEPENDS_TARGET "toolchain"
                       "libiconv"
                       "zlib"
                       "bzip2"
                       "gnutls"
                       "dav1d")
set(PKG_TOOLCHAIN "custom")

# todo: sed patches

set(PKG_CONFIGURE_OPTS_SHARED "--extra-version=kodi-${PKG_VERSION}"
                              "--disable-devices"
                              "--disable-doc"
                              "--disable-ffplay"
                              "--disable-ffmpeg"
                              "--disable-ffprobe"
                              "--disable-sdl2"
                              "--enable-gpl"
                              "--enable-runtime-cpudetect"
                              "--enable-postproc"
                              "--enable-pthreads"
                              "--enable-muxer=spdif"
                              "--enable-muxer=adts"
                              "--enable-muxer=asf"
                              "--enable-muxer=ipod"
                              "--enable-encoder=ac3"
                              "--enable-encoder=aac"
                              "--enable-encoder=wmav2"
                              "--enable-protocol=http"
                              "--enable-gnutls"
                              "--enable-encoder=png"
                              "--enable-encoder=mjpeg"
                              "--enable-libdav1d"
                              "--enable-cross-compile"
                              "--enable-pic"
                              "--disable-linux-perf")

set(PKG_CONFIGURE_OPTS_HOST "--prefix=${INSTALL_PREFIX_HOST}"
                            ${PKG_CONFIGURE_OPTS_SHARED})

if(ENABLE_CCACHE AND CCACHE_PROGRAM)
  list(APPEND PKG_CONFIGURE_OPTS_HOST "--cc=${CCACHE_PROGRAM} ${CMAKE_C_COMPILER}"
                                      "--cxx=${CCACHE_PROGRAM} ${CMAKE_CXX_COMPILER}")
endif()

set(PKG_CONFIGURE_OPTS_TARGET "--prefix=${INSTALL_PREFIX_TARGET}"
                              "--cc=${TARGET_CC}"
                              "--cxx=${TARGET_CXX}"
                              "--ar=${TARGET_AR}"
                              "--ranlib=${TARGET_RANLIB}"
                              "--strip=${TARGET_STRIP}"
                              "--extra-libs=-liconv"
                              ${PKG_CONFIGURE_OPTS_SHARED})

if(WITH_FFMPEG_OPTIONS)
  list(APPEND PKG_CONFIGURE_OPTS_HOST "${WITH_FFMPEG_OPTIONS}")
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "${WITH_FFMPEG_OPTIONS}")
endif()

if(CMAKE_BUILD_TYPE STREQUAL Release)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--disable-debug")
endif()

if(CORE_SYSTEM_NAME STREQUAL linux)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--arch=${WITH_CPU}"
                                        "--target-os=linux")
elseif(CORE_SYSTEM_NAME STREQUAL android)
  if(WITH_CPU MATCHES arm64)
    list(APPEND PKG_CONFIGURE_OPTS_TARGET "--target-os=linux"
                                          "--arch=aarch64"
                                          "--cpu=cortex-a53")
  elseif(WITH_CPU MATCHES arm)
    list(APPEND PKG_CONFIGURE_OPTS_TARGET "--target-os=linux"
                                          "--cpu=cortex-a9")
  else()
    list(APPEND PKG_CONFIGURE_OPTS_TARGET "--target-os=linux"
                                          "--cpu=i686"
                                          "--disable-mmx"
                                          "--extra-cflags=-no-integrated-as -mno-stackrealign")
  endif()
elseif(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--arch=${WITH_CPU}"
                                        "--as=${TARGET_AS}"
                                        "--x86asmexe=$(NATIVEPREFIX)/bin/yasm"
                                        "--disable-crystalhd"
                                        "--enable-videotoolbox"
                                        "--target-os=darwin")
endif()

if(WITH_CPU MATCHES arm)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--enable-pic"
                                        "--disable-armv5te"
                                        "--disable-armv6t2")
endif()

set(PKG_CONFIGURE_COMMAND_HOST PKG_CONFIG_PATH=${INSTALL_PREFIX_HOST}/lib/pkgconfig ./configure ${PKG_CONFIGURE_OPTS_HOST})
set(PKG_BUILD_COMMAND_HOST $(MAKE))
set(PKG_INSTALL_COMMAND_HOST $(MAKE) install)

set(PKG_CONFIGURE_COMMAND_TARGET ./configure ${PKG_CONFIGURE_OPTS_TARGET})
set(PKG_BUILD_COMMAND_TARGET $(MAKE))
set(PKG_INSTALL_COMMAND_TARGET $(MAKE) install)

