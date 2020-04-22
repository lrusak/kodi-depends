set(PKG_NAME "dummy-lib")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "virtual")

configure_file(${CMAKE_CURRENT_LIST_DIR}/dummy-libxbmc.c
               ${BUILD_DIR_TARGET}/${PKG_NAME}/dummy-libxbmc.c COPYONLY)

string(REPLACE " " ";" TARGET_CC_LIST "${TARGET_CC}")

add_custom_COMMAND(OUTPUT ${BUILD_DIR_TARGET}/${PKG_NAME}/lib${APP_NAME}.so
                   COMMAND ${TARGET_CC_LIST} -shared -o lib${APP_NAME}.so dummy-libxbmc.c
                   COMMAND mkdir -p ${INSTALL_PREFIX_TARGET}/lib/dummy-lib${APP_NAME}
                   COMMAND install -v lib${APP_NAME}.so ${INSTALL_PREFIX_TARGET}/lib/dummy-lib${APP_NAME}
                   WORKING_DIRECTORY ${BUILD_DIR_TARGET}/${PKG_NAME}
                   COMMENT "Building dummy lib${APP_NAME}.so")

add_custom_target(${PKG_NAME}-target-meta
                  DEPENDS ${BUILD_DIR_TARGET}/${PKG_NAME}/lib${APP_NAME}.so)

unset(TARGET_CC_LIST)
