set(PKG_NAME "nettle")
set(PKG_VERSION "3.5.1")
set(PKG_SHA256 "75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "gmp")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-disable_testsuite.patch")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--disable-openssl")

if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--disable-assembler")
endif()
