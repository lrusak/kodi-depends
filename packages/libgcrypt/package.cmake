set(PKG_NAME "libgcrypt")
set(PKG_VERSION "1.8.1")
set(PKG_SHA256 "7a2875f8b1ae0301732e878c0cca2c9664ff09ef71408f085c50e332656a78b3")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "libgpg-error")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-gcrypt-android-select.patch"
                "02-fix-armv7-neon.patch"
                "04-fix-o-flag-munging.patch"
                "05-all-remove-docs-tests.patch")
set(PKG_AUTORECONF ON)

if(NOT WITH_CPU MATCHES "arm64")
  list(APPEND PKG_PATCHES "03-remove-cipher-gcm-armv8.patch")
endif()

# todo: sed patches

set(PKG_CONFIGURE_OPTS_TARGET "ac_cv_path_GPG_ERROR_CONFIG=${INSTALL_PREFIX_TARGET}/bin/gpg-error-config"
                              "--disable-doc"
                              "--disable-shared")

if(WITH_CPU MATCHES "arm64")
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--disable-asm")
else()
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--disable-asm"
                                        "--disable-arm-crypto-support")
endif()

if(CORE_SYSTEM_NAME STREQUAL osx)
  list(APPEND PKG_CONFIGURE_OPTS_TARGET "--disable-asm"
                                        "--disable-avx-support"
                                        "--disable-avx2-support")
endif()

