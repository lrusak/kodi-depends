if(ENABLE_CCACHE)
  find_program(CCACHE_PROGRAM ccache)
endif()

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "CMake build type" FORCE)
endif()

if(NOT CMAKE_CXX_EXTENSIONS)
  set(CMAKE_CXX_EXTENSIONS OFF CACHE BOOL "CMake CXX Extentions")
endif()

if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14 CACHE STRING "CMake CXX Standard")
endif()

file(STRINGS ${WITH_KODI_SOURCE}/version.txt VERSION_TXT)
string(REGEX MATCH "APP_NAME ([^ ]*);" APP_NAME "${VERSION_TXT}")
string(TOLOWER ${CMAKE_MATCH_1} APP_NAME)

# set host/target install locations
set(INSTALL_PREFIX_TARGET ${WITH_PREFIX}/${WITH_TARGET} CACHE STRING "Path to target install prefix" FORCE)
set(INSTALL_PREFIX_HOST ${WITH_PREFIX}/${WITH_HOST} CACHE STRING "Path to host install prefix" FORCE)

# set host/target build locations
set(BUILD_DIR_TARGET ${CMAKE_BINARY_DIR}/build-target CACHE STRING "Path to target build prefix" FORCE)
set(BUILD_DIR_HOST ${CMAKE_BINARY_DIR}/build-host CACHE STRING "Path to host build prefix" FORCE)

if(WITH_CPU MATCHES "arm64|aarch64")
  set(MESON_CPU aarch64)
elseif(WITH_CPU MATCHES "arm")
  set(MESON_CPU arm)
elseif(WITH_CPU MATCHES "x86_64")
  set(MESON_CPU x86_64)
elseif(WITH_CPU MATCHES "i386|i686|x86")
  set(MESON_CPU x86)
endif()

if(WITH_CPU AND NOT MESON_CPU)
  message(FATAL_ERROR "MESON_CPU invalid. Check WITH_CPU")
endif()

if(CORE_PLATFORM_NAME_LC IN_LIST VALID_LINUX_PLATFORMS_LIST)
  include(${WITH_KODI_DEPENDS}/cmake/platform/linux/Configuration.cmake)
else()
  include(${WITH_KODI_DEPENDS}/cmake/platform/${CORE_PLATFORM_NAME_LC}/Configuration.cmake)
endif()

if(NOT CORE_SYSTEM_NAME)
  message(FATAL_ERROR "CORE_SYSTEM_NAME not set. Check that it's defined for your platform: ${CORE_PLATFORM_NAME_LC}")
endif()

if(NOT MESON_SYSTEM)
  message(FATAL_ERROR "MESON_SYSTEM not set. Check that it's defined for your platform: ${CORE_PLATFORM_NAME_LC}")
endif()

# sanity check that these are strings
string(REPLACE ";" " " WITH_TARGET_CFLAGS "${WITH_TARGET_CFLAGS}")
string(REPLACE ";" " " WITH_TARGET_CXXFLAGS "${WITH_TARGET_CXXFLAGS}")
string(REPLACE ";" " " WITH_TARGET_LDFLAGS "${WITH_TARGET_LDFLAGS}")

# CONFIG FLAGS (should be possible on all platforms)
set(PLATFORM_INCLUDES "-I${INSTALL_PREFIX_TARGET}/include -isystem ${INSTALL_PREFIX_TARGET}/include" CACHE STRING "" FORCE)

set(PLATFORM_CFLAGS "${WITH_TARGET_CFLAGS} ${PLATFORM_INCLUDES}" CACHE STRING "" FORCE)
set(PLATFORM_CXXFLAGS "${WITH_TARGET_CFLAGS} ${WITH_TARGET_CXXFLAGS} ${PLATFORM_INCLUDES}" CACHE STRING "" FORCE)
set(PLATFORM_LDFLAGS "${WITH_TARGET_LDFLAGS} -L${INSTALL_PREFIX_TARGET}/lib" CACHE STRING "" FORCE)
