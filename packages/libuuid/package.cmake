set(PKG_NAME "libuuid")
set(PKG_VERSION "1.42.13")
set(PKG_SHA256 "e16474b5a3a30f9197160c4b91bd48d5a463583049c0fcc405b6f0f7075aa0c7")
set(PKG_ARCHIVE "e2fsprogs-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_BUILD_CFLAGS_TARGET "-fPIC")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-fsck")

set(PKG_MAKE_OPTS_TARGET -C lib/uuid)
set(PKG_MAKE_INSTALL_OPTS_TARGET -C lib/uuid install)

if(APPLE)
  set(PKG_TOOLCHAIN "virtual")
endif()
