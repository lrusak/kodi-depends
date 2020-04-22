set(PKG_NAME "libgpg-error")
set(PKG_VERSION "1.36")
set(PKG_SHA256 "babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-libgpg-error-1.36-gawk5-support.patch"
                "02-android.patch")
set(PKG_AUTORECONF ON)

if(CORE_PLATFORM_NAME_LC STREQUAL tvos)
  list(APPEND PKG_PATCHES "03-tvos_remove-fork.patch")
endif()

set(PKG_CONFIGURE_OPTS_TARGET "--disable-doc"
                              "--disable-tests"
                              "--disable-languages"
                              "--disable-nls"
                              "--disable-shared")

