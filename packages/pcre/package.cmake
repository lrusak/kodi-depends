set(PKG_NAME "pcre")
set(PKG_VERSION "8.42")
set(PKG_SHA256 "69acbc2fbdefb955d42a4c606dfde800c2885711d2979e356c0636efde9ec3b5")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "toolchain")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")
set(PKG_PATCHES "01-tvos-bitcode-fix.patch"
                "02-jit_aarch64.patch"
                "03-ios-clear_cache.patch")

set(PKG_CONFIGURE_OPTS_SHARED "--disable-shared"
                              "--disable-stack-for-recursion"
                              "--enable-pcre8"
                              "--disable-pcre16"
                              "--disable-pcre32"
                              "--enable-jit"
                              "--enable-utf"
                              "--enable-unicode-properties"
                              "--enable-newline-is-anycrlf")

set(PKG_CONFIGURE_OPTS_HOST ${PKG_CONFIGURE_OPTS_SHARED}
                            "--disable-cpp")

set(PKG_CONFIGURE_OPTS_TARGET ${PKG_CONFIGURE_OPTS_SHARED})

