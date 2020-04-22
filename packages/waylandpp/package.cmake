set(PKG_NAME "waylandpp")
set(PKG_VERSION "0.2.3")
set(PKG_SHA256 "ebd4a8447bb65f288cad0e04538f6ec704e155213fc2b9cc1a851534c70aacac")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_HOST "wayland")
set(PKG_DEPENDS_TARGET "wayland"
                       "waylandpp-host")
set(PKG_TOOLCHAIN "cmake")

if(CORE_PLATFORM_NAME_LC MATCHES "gbm|wayland" AND WITH_RENDERSYSTEM STREQUAL gles)
  list(APPEND PKG_DEPENDS_TARGET "mesa")
endif()

set(PKG_CMAKE_OPTS_HOST "-DBUILD_DOCUMENTATION=OFF"
                        "-DBUILD_LIBRARIES=OFF"
                        "-DBUILD_EXAMPLES=OFF"
                        "-DBUILD_SCANNER=ON")

set(PKG_CMAKE_OPTS_TARGET "-DBUILD_SCANNER=OFF"
                          "-DWAYLAND_SCANNERPP=${INSTALL_PREFIX_HOST}/bin/wayland-scanner++"
                          "-DBUILD_DOCUMENTATION=OFF"
                          "-DBUILD_LIBRARIES=ON"
                          "-DBUILD_EXAMPLES=OFF")
