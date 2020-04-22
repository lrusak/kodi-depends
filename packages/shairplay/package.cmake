set(PKG_NAME "shairplay")
set(PKG_VERSION "096b61a")
set(PKG_SHA256 "63d407f40f48174bc021acd64f572e91ea85bfd99f918e94a7216c944c210a1a")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-configure-fix-dns-sd-check.patch")
set(PKG_AUTORECONF ON)

