set(PKG_NAME "libpng")
set(PKG_VERSION "1.6.26")
set(PKG_SHA256 "81bfc8f16ed125622c0c5ad44eeffda19e7a7c7e32f47e43c8932bf32deae7cc")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain"
                     "zlib")
set(PKG_DEPENDS_TARGET "toolchain"
                       "zlib")
set(PKG_TOOLCHAIN "autotools")

