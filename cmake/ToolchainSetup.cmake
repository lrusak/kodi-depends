# Find programs

set(CMAKE_FIND_ROOT_PATH ${WITH_TOOLCHAIN})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

unset(MISSING_COMPONENTS)

find_program(TARGET_CC NAMES ${WITH_TARGET}-gcc
                             ${WITH_TARGET}-clang
                             ${WITH_TARGET}${WITH_NDK_API}-clang
                             clang)
if(NOT TARGET_CC)
  list(APPEND MISSING_COMPONENTS TARGET_CC)
else()
  message(STATUS "found TARGET_CC: ${TARGET_CC}")
endif()

find_program(TARGET_CXX NAMES ${WITH_TARGET}-g++
                              ${WITH_TARGET}-clang++
                              ${WITH_TARGET}${WITH_NDK_API}-clang++
                              clang++)
if(NOT TARGET_CXX)
  list(APPEND MISSING_COMPONENTS TARGET_CXX)
else()
  message(STATUS "found TARGET_CXX: ${TARGET_CXX}")
endif()

find_program(TARGET_CPP NAMES ${WITH_TARGET}-cpp
                              ${WITH_TARGET}-clang-cpp)
if(NOT TARGET_CPP)
  # todo
  # include(CheckCCompilerFlag)
  # check_c_compiler_flag(-E C_COMPILER_AS_CPP)

  # if(C_COMPILER_AS_CPP)
    set(TARGET_CPP "${TARGET_CC} -E")
  # else()
    # list(APPEND MISSING_COMPONENTS TARGET_CPP)
  # endif()
else()
  message(STATUS "found TARGET_CPP: ${TARGET_CPP}")
endif()

find_program(TARGET_LD NAMES ${WITH_TARGET}-ld
                             ld)
if(NOT TARGET_LD)
  list(APPEND MISSING_COMPONENTS TARGET_LD)
else()
  message(STATUS "found TARGET_LD: ${TARGET_LD}")
endif()

find_program(TARGET_AS NAMES ${WITH_TARGET}-as
                             as)
if(NOT TARGET_AS)
  list(APPEND MISSING_COMPONENTS TARGET_AS)
else()
  message(STATUS "found TARGET_AS: ${TARGET_AS}")
endif()

find_program(TARGET_AR NAMES ${WITH_TARGET}-ar
                             ar)
if(NOT TARGET_AR)
  list(APPEND MISSING_COMPONENTS TARGET_AR)
else()
  message(STATUS "found TARGET_AR: ${TARGET_AR}")
endif()

find_program(TARGET_NM NAMES ${WITH_TARGET}-nm
                             nm)
if(NOT TARGET_NM)
  list(APPEND MISSING_COMPONENTS TARGET_NM)
else()
  message(STATUS "found TARGET_NM: ${TARGET_NM}")
endif()

find_program(TARGET_RANLIB NAMES ${WITH_TARGET}-ranlib
                                 ranlib)
if(NOT TARGET_RANLIB)
  list(APPEND MISSING_COMPONENTS TARGET_RANLIB)
else()
  message(STATUS "found TARGET_RANLIB: ${TARGET_RANLIB}")
endif()

# not sure if actually needed?
# find_program(TARGET_OBJCOPY NAMES ${WITH_TARGET}-objcopy
#                                   objcopy)
# if(NOT TARGET_OBJCOPY)
#   list(APPEND MISSING_COMPONENTS TARGET_OBJCOPY)
# else()
#   message(STATUS "found TARGET_OBJCOPY: ${TARGET_OBJCOPY}")
# endif()

find_program(TARGET_OBJDUMP NAMES ${WITH_TARGET}-objdump
                                  objdump)
if(NOT TARGET_OBJDUMP)
  list(APPEND MISSING_COMPONENTS TARGET_OBJDUMP)
else()
  message(STATUS "found TARGET_OBJDUMP: ${TARGET_OBJDUMP}")
endif()

find_program(TARGET_STRIP NAMES ${WITH_TARGET}-strip
                                strip)
if(NOT TARGET_STRIP)
  list(APPEND MISSING_COMPONENTS TARGET_STRIP)
else()
  message(STATUS "found TARGET_STRIP: ${TARGET_STRIP}")
endif()

if(WITH_HOSTTOOLCHAIN)
  find_program(HOST_CC NAMES ${WITH_HOST}-gcc
                             ${WITH_HOST}-clang
                             gcc
                             clang
                       PATHS ${WITH_HOSTTOOLCHAIN}/usr/bin
                             ${WITH_HOSTTOOLCHAIN}/bin
                       NO_DEFAULT_PATH
                       NO_CMAKE_FIND_ROOT_PATH)

  find_program(HOST_CXX NAMES ${WITH_HOST}-g++
                              ${WITH_HOST}-clang++
                              g++
                              clang++
                        PATHS ${WITH_HOSTTOOLCHAIN}/usr/bin
                              ${WITH_HOSTTOOLCHAIN}/bin
                        NO_DEFAULT_PATH
                        NO_CMAKE_FIND_ROOT_PATH)
else()
  find_program(HOST_CC NAMES ${WITH_HOST}-gcc
                             ${WITH_HOST}-clang
                             gcc
                             clang
                       NO_CMAKE_FIND_ROOT_PATH)

  find_program(HOST_CXX NAMES ${WITH_HOST}-g++
                              ${WITH_HOST}-clang++
                              g++
                              clang++
                        NO_CMAKE_FIND_ROOT_PATH)
endif()

if(NOT HOST_CC)
  list(APPEND MISSING_COMPONENTS HOST_CC)
else()
  message(STATUS "found HOST_CC: ${HOST_CC}")
endif()

if(NOT HOST_CXX)
  list(APPEND MISSING_COMPONENTS HOST_CXX)
else()
  message(STATUS "found HOST_CXX: ${HOST_CXX}")
endif()

find_program(PATCH_COMMAND patch
                           NO_CMAKE_FIND_ROOT_PATH)
if(NOT PATCH_COMMAND)
  list(APPEND MISSING_COMPONENTS PATCH_COMMAND)
else()
  message(STATUS "found PATCH_COMMAND: ${PATCH_COMMAND}")
endif()

if(MISSING_COMPONENTS)
  message(FATAL_ERROR "Missing components: ${MISSING_COMPONENTS}")
endif()

# allow specifying tools for specific platforms
if(EXISTS "${WITH_KODI_DEPENDS}/cmake/platform/${CORE_PLATFORM_NAME_LC}/Toolchain.cmake")
  include(${WITH_KODI_DEPENDS}/cmake/platform/${CORE_PLATFORM_NAME_LC}/Toolchain.cmake)
endif()

# Configure toolchain files
configure_file(${CMAKE_SOURCE_DIR}/toolchain/Toolchain.cmake.in ${CMAKE_BINARY_DIR}/Toolchain.cmake @ONLY)

configure_file(${CMAKE_SOURCE_DIR}/toolchain/meson-cross-setup.sh.in ${CMAKE_BINARY_DIR}/meson-cross-setup.sh @ONLY)

# after configure_file because cmake uses a launch rule and meson doesn't like cc=/usr/bin/ccache /usr/bin/cc anyways
if(ENABLE_CCACHE AND CCACHE_PROGRAM)
  set(TARGET_CC  "${CCACHE_PROGRAM} ${TARGET_CC}")
  set(TARGET_CXX "${CCACHE_PROGRAM} ${TARGET_CXX}")
  set(TARGET_CPP "${CCACHE_PROGRAM} ${TARGET_CPP}")
endif()
