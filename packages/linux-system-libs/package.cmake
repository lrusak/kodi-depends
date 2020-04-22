set(PKG_NAME "linux-system-libs")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "virtual")

set(PKGCONFIG_FILE_LIST damageproto.pc
                        egl.pc
                        fixesproto.pc
                        ice.pc
                        kbproto.pc
                        libdrm.pc
                        libva.pc
                        pthread-stubs.pc
                        randrproto.pc
                        renderproto.pc
                        sm.pc
                        wayland-egl.pc
                        x11.pc
                        x11-xcb.pc
                        xau.pc
                        xcb-dri2.pc
                        xcb-dri3.pc
                        xcb-glx.pc
                        xcb.pc
                        xcb-present.pc
                        xcb-randr.pc
                        xcb-render.pc
                        xcb-shape.pc
                        xcb-xfixes.pc
                        xdamage.pc
                        xdmcp.pc
                        xext.pc
                        xextproto.pc
                        xf86vidmodeproto.pc
                        xfixes.pc
                        xkbcommon.pc
                        xmu.pc
                        xproto.pc
                        xrandr.pc
                        xrender.pc
                        xshmfence.pc
                        xt.pc
                        xxf86vm.pc)

if(CORE_PLATFORM_NAME_LC STREQUAL x11 OR WITH_RENDERSYSTEM STREQUAL gl)

  execute_process(COMMAND pkg-config --variable pc_path pkg-config
                  OUTPUT_VARIABLE PKG_CONFIG_HOST_LOCATION_STRING)

  string(REPLACE ":" ";" PKG_CONFIG_HOST_LOCATION_LIST "${PKG_CONFIG_HOST_LOCATION_STRING}")

  foreach(PKG_CONFIG_HOST_LOCATION ${PKG_CONFIG_HOST_LOCATION_LIST})
    if(PKG_CONFIG_HOST_LOCATION MATCHES "lib")
      set(PKG_CONFIG_HOST_PATH ${PKG_CONFIG_HOST_LOCATION})
      break()
    endif()
  endforeach()

  message(STATUS "PKG_CONFIG_HOST_PATH: ${PKG_CONFIG_HOST_PATH}")

  if(NOT EXISTS ${INSTALL_PREFIX_TARGET}/lib/pkgconfig)
    file(MAKE_DIRECTORY ${INSTALL_PREFIX_TARGET}/lib/pkgconfig)
  endif()

  foreach(PKGCONFIG_FILE ${PKGCONFIG_FILE_LIST})
    if(NOT EXISTS ${PKG_CONFIG_HOST_PATH}/${PKGCONFIG_FILE})
      message(STATUS "${PKGCONFIG_FILE} doesn't exist on the host system. Do you have the correct devel package installed?")
    endif()

    if(NOT EXISTS ${INSTALL_PREFIX_TARGET}/lib/pkgconfig/${PKGCONFIG_FILE})
      execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink ${PKG_CONFIG_HOST_PATH}/${PKGCONFIG_FILE} ${INSTALL_PREFIX_TARGET}/lib/pkgconfig/${PKGCONFIG_FILE})
    endif()
  endforeach()

endif()
