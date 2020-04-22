set(PKG_NAME "libevdev")
set(PKG_VERSION "1.5.8")
set(PKG_SHA256 "6083d81e46609da8ba80cb826c02d9080764a6dec33c8267ccb7e158833d4c6d")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.xz")
set(PKG_DEPENDS_TARGET "libudev")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--disable-shared"
                              "--enable-static"
                              "--disable-tests")

