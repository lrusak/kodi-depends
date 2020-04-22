set(PKG_NAME "sqlite")
set(PKG_VERSION "3260000")
set(PKG_SHA256 "5daa6a3fb7d1e8c767cd59c4ded8da6e4b00c61d3b466d0685e35c4dd6d7bf5d")
set(PKG_ARCHIVE "${PKG_NAME}-autoconf-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-sqlite3.c.patch"
                "02-all-disable-bin-build.patch")
set(PKG_AUTORECONF ON)

set(PKG_BUILD_CFLAGS_TARGET "-DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_TEMP_STORE=3 -DSQLITE_DEFAULT_MMAP_SIZE=0x10000000")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--enable-threadsafe"
                              "--disable-readline")

