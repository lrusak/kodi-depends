set(PKG_NAME "gmp")
set(PKG_VERSION "6.1.2")
set(PKG_SHA256 "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_BUILD_CFLAGS_TARGET "-fPIC")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared")

if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--disable-assembly")
endif()
