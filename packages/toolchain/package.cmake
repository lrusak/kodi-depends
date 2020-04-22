set(PKG_NAME "toolchain")
set(PKG_DEPENDS_HOST "m4"
                     "autoconf"
                     "automake"
                     "libtool"
                     "pkg-config"
                     "gettext")

if(APPLE)
  list(APPEND PKG_DEPENDS_HOST "gas-preprocessor")
endif()

set(PKG_DEPENDS_TARGET "toolchain-host")
set(PKG_TOOLCHAIN "virtual")


