# Process packages

file(GLOB files "packages/*/package.cmake")

foreach(file ${files})
  include(${file})
  add_depends_for_targets("HOST;TARGET")
endforeach()

add_custom_target(kodi-depends ALL
                  COMMENT "custom target to allow building kodi dependencies")

add_dependencies(kodi-depends
                 JsonSchemaBuilder-host
                 TexturePacker-host
                 Python-target
                 zlib-target
                 lzo-target
                 pcre-target
                 swig-host
                 libass-target
                 curl-target
                 fontconfig-target
                 fribidi-target
                 tinyxml-target
                 libjpeg-turbo-target
                 freetype-target
                 libcdio-target
                 taglib-target
                 libxml2-target
                 libxslt-target
                 rapidjson-target
                 sqlite-target
                 ffmpeg-target
                 crossguid-target
                 libdvdnav-target
                 fmt-target
                 fstrcmp-target
                 flatbuffers-host
                 flatbuffers-target
                 libudfread-target
                 spdlog-target
                 libbluray-target
                 # mariadb-target symbol clashes, disable for now
                 libnfs-target
                 samba-target
                 libmicrohttpd-target
                 pillow-target
                 pycryptodome-target
                 setuptools-target)

if(NOT CORE_SYSTEM_NAME STREQUAL darwin_embedded AND NOT CORE_SYSTEM_NAME STREQUAL android)
  add_dependencies(kodi-depends
                   libcec-target)
endif()

if(NOT CORE_PLATFORM_NAME_LC STREQUAL tvos)
  add_dependencies(kodi-depends
                   libplist-target
                   shairplay-target)
endif()

if(CORE_SYSTEM_NAME STREQUAL osx)
  add_dependencies(kodi-depends
                   libsdl-target)
endif()

if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
  add_dependencies(kodi-depends
                   gen_entitlements-host
                   iosentitlements-target)
endif()

if(NOT CORE_SYSTEM_NAME STREQUAL osx AND NOT CORE_SYSTEM_NAME STREQUAL darwin_embedded AND NOT CORE_SYSTEM_NAME STREQUAL android)
  add_dependencies(kodi-depends
                   libusb-target)
endif()

if(CORE_SYSTEM_NAME STREQUAL linux)
  add_dependencies(kodi-depends
                   dbus-target
                   alsa-lib-target
                   libuuid-target)
endif()

if(CORE_PLATFORM_NAME_LC STREQUAL wayland)
  add_dependencies(kodi-depends
                   wayland-target
                   waylandpp-target)
endif()

if(CORE_PLATFORM_NAME_LC MATCHES "gbm|wayland" AND WITH_RENDERSYSTEM STREQUAL gles)
  add_dependencies(kodi-depends
                   mesa-target
                   libxkbcommon-target)
endif()

if(CORE_PLATFORM_NAME_LC STREQUAL gbm OR CORE_PLATFORM_NAME_LC STREQUAL rbpi)
  add_dependencies(kodi-depends
                   libinput-target
                   libxkbcommon-target)
endif()

if(CORE_SYSTEM_NAME STREQUAL android)
  add_dependencies(kodi-depends
                   libuuid-target
                   libandroidjni-target
                   libzip-target)
endif()
