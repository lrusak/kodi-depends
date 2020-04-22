set(PKG_NAME "mariadb")
set(PKG_VERSION "3.1.7")
set(PKG_SHA256 "64f7bc8f5df3200ba6e3080f68ee4942382a33e8371baea8ca4b9242746df59a")
set(PKG_ARCHIVE "${PKG_NAME}-connector-c-${PKG_VERSION}-src.tar.gz")
set(PKG_DEPENDS_TARGET "openssl"
                       "libiconv"
                       "zlib")
set(PKG_TOOLCHAIN "cmake")
set(PKG_PATCHES "01-android.patch"
                "02-all-symbol-rename-gnutls-clash.patch")

if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  list(APPEND PKG_PATCHES_TARGET "03-apple-findiconv-cross.patch")
endif()

# todo: sed patches

# Static build of DCLIENT_PLUGIN_CLIENT_ED25519 fails
# plugins/auth/ref10/crypto_hash_sha512.h:5:10: fatal error: 'mysql/service_sha2.h' file not found

set(PKG_CMAKE_OPTS_TARGET "-DAUTH_GSSAPI_PLUGIN_TYPE=OFF"
                          "-DCLIENT_PLUGIN_DIALOG=STATIC"
                          "-DWITH_SSL=ON"
                          "-DWITH_UNIT_TESTS:BOOL=OFF"
                          "-DWITH_EXTERNAL_ZLIB:BOOL=ON"
                          "-DWITH_CURL:BOOL=OFF"
                          "-DCLIENT_PLUGIN_SHA256_PASSWORD=STATIC"
                          "-DCLIENT_PLUGIN_CACHING_SHA2_PASSWORD=STATIC"
                          "-DCLIENT_PLUGIN_MYSQL_CLEAR_PASSWORD=STATIC"
                          "-DCLIENT_PLUGIN_MYSQL_OLD_PASSWORD=STATIC"
                          "-DCLIENT_PLUGIN_CLIENT_ED25519=OFF")
if(APPLE)
  list(APPEND PKG_CMAKE_OPTS_TARGET "-DWITH_SDK_PATH=${WITH_SDK_PATH}")
endif()
