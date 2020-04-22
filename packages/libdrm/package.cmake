set(PKG_NAME "libdrm")
set(PKG_VERSION "2.4.100")
set(PKG_SHA256 "6a5337c054c0c47bc16607a21efa2b622e08030be4101ef4a241c5eb05b6619b")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_URL "https://dri.freedesktop.org/${PKG_NAME}/${PKG_ARCHIVE}")
set(PKG_DEPENDS_TARGET "meson-host"
                       "ninja-host")
set(PKG_TOOLCHAIN "meson")

set(PKG_MESON_OPTS_TARGET "-Dlibkms=false"
                          "-Dnouveau=false"
                          "-Domap=false"
                          "-Dexynos=false"
                          "-Dtegra=false"
                          "-Dintel=false"
                          "-Dradeon=false"
                          "-Damdgpu=false"
                          "-Dvmwgfx=false"
                          "-Dvc4=false"
                          "-Dfreedreno=false"
                          "-Detnaviv=false"
                          "-Dcairo-tests=false"
                          "-Dman-pages=false"
                          "-Dvalgrind=false"
                          "-Dfreedreno-kgsl=false"
                          "-Dinstall-test-programs=false"
                          "-Dudev=false")

