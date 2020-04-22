set(PKG_NAME "pillow")
set(PKG_VERSION "3.0.0")
set(PKG_SHA256 "780f21465e2b7690fc55925188373cd54668ea4d71964f971e1fea4bc16d365e")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.gz")
set(PKG_DEPENDS_TARGET "Python-host"
                       "zlib"
                       "bzip2"
                       "libjpeg-turbo"
                       "libpng"
                       "freetype"
                       "setuptools")
set(PKG_TOOLCHAIN "custom")
set(PKG_PATCHES "01-pillow-crosscompile.patch")

set(PKG_LDSHARED "${TARGET_CC} -shared")

if(CORE_SYSTEM_NAME STREQUAL android)
  list(APPEND PKG_DEPENDS_TARGET "dummy-lib")
  string(APPEND PKG_LDSHARED " -L${INSTALL_PREFIX_TARGET}/lib/dummy-lib${APP_NAME}/ -l${APP_NAME}")
  set(PILLOW_EGG Pillow-3.0.0-py3.7.egg-info)
  set(PILLOW_PATH ${INSTALL_PREFIX_TARGET}/share/${APP_NAME}/addons/script.module.pil/lib)

  set(PKG_BUILD_COMMAND_TARGET LDSHARED=${PKG_LDSHARED} ${INSTALL_PREFIX_HOST}/bin/python3 setup.py build_ext --plat-name ${CORE_SYSTEM_NAME}-${WITH_CPU})
  set(PKG_INSTALL_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --install-lib ${PILLOW_PATH} --prefix=${INSTALL_PREFIX_TARGET} --root=/)

  set(PKG_POST_INSTALL_COMMAND_TARGET "rm -r ${PILLOW_PATH}/${PILLOW_EGG}")
else()
  set(PKG_BUILD_COMMAND_TARGET LDSHARED=${PKG_LDSHARED} ${INSTALL_PREFIX_HOST}/bin/python3 setup.py build_ext --plat-name ${CORE_SYSTEM_NAME}-${WITH_CPU})
  set(PKG_INSTALL_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/python3 setup.py install --prefix=${INSTALL_PREFIX_TARGET})
endif()

