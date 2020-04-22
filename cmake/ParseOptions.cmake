# required options
set(WITH_PREFIX CACHE STRING "Prefix path to install depends")
set(WITH_TOOLCHAIN CACHE STRING "Path to toolchain")
set(WITH_CPU CACHE STRING "Target CPU")
set(WITH_HOST CACHE STRING "Host OS triplet")
set(WITH_TARGET CACHE STRING "Target OS triplet")
set(WITH_KODI_SOURCE CACHE STRING "Path to kodi source (needed for TexturePacker)")

if(NOT WITH_PREFIX)
  message(FATAL_ERROR "No prefix specified. For example -DWITH_PREFIX=/opt/kodi-depends")
endif()

if(NOT IS_ABSOLUTE ${WITH_PREFIX})
  message(FATAL_ERROR "WITH_PREFIX must be an absolute path. For example -DWITH_PREFIX=/opt/kodi-depends")
endif()

if(NOT WITH_TOOLCHAIN)
  message(FATAL_ERROR "No toolchain specified. For example -DWITH_TOOLCHAIN=/usr/arm-linux-gnueabi")
endif()

if(NOT IS_ABSOLUTE ${WITH_TOOLCHAIN})
  message(FATAL_ERROR "WITH_TOOLCHAIN must be an absolute path. For example -DWITH_TOOLCHAIN=/usr/arm-linux-gnueabi")
endif()

# todo: s/WITH_CPU/WITH_TARGET_CPU/g ???
if(NOT WITH_CPU)
  message(FATAL_ERROR "No target cpu specified. For example -DWITH_CPU=armeabi-v7a")
endif()

# rough check
if(NOT WITH_CPU MATCHES "arm|x86|aarch64")
  message(FATAL_ERROR "Specified cpu not valid. For example -DWITH_CPU=armeabi-v7a")
endif()

if(NOT WITH_HOST)
  message(FATAL_ERROR "No host triplet specified. For example -DWITH_HOST=x86_64-redhat-linux")
endif()

# rough check
if(NOT WITH_HOST MATCHES "[^ ]*-[^ ]*-[^ ]*")
  message(FATAL_ERROR "Specified host triplet not valid. For example -DWITH_HOST=x86_64-redhat-linux")
endif()

if(NOT WITH_TARGET)
  message(FATAL_ERROR "No target triplet specified. For example -DWITH_TARGET=arm-linux-gnueabi")
endif()

# rough check
if(NOT WITH_TARGET MATCHES "[^ ]*-[^ ]*-[^ ]*")
  message(FATAL_ERROR "Specified target triplet not valid. For example -DWITH_TARGET=arm-linux-gnueabi")
endif()

if(NOT WITH_KODI_SOURCE OR NOT EXISTS ${WITH_KODI_SOURCE}/CMakeLists.txt)
  message(FATAL_ERROR "No Kodi source specified. For example -DWITH_KODI_SOURCE=../xbmc")
endif()

# optional options
option(ENABLE_CCACHE "Enable building with ccache support" ON)
option(ENABLE_GPLV3 "Enable building GPLv3 components" ON)
option(ENABLE_CONSOLE_LOGGING "Enable console output when building dependencies (no log files will be created)" ON)

set(WITH_ARCHIVES ${WITH_PREFIX}/kodi-archives CACHE STRING "Path to where archives will be saved")

set(WITH_TARGET_CFLAGS CACHE STRING "C compiler flags (target)")
set(WITH_TARGET_CXXFLAGS CACHE STRING "C++ compiler flags (target)")
set(WITH_TARGET_LDFLAGS CACHE STRING "linker flags (target)")

set(WITH_FFMPEG_OPTIONS CACHE STRING "FFmpeg configure options (target)")

# darwin and android
set(WITH_SDK_PATH CACHE STRING "path to SDK (only for android)")
set(WITH_SDK_PLATFORM_VERSION CACHE STRING "SDK platform version")

if(CORE_PLATFORM_NAME_LC MATCHES "android|tvos|ios|osx")
  if(NOT IS_ABSOLUTE ${WITH_SDK_PATH})
    message(FATAL_ERROR "WITH_SDK_PATH must be an absolute path. For example -DWITH_NDK_PATH=/opt/android-tools/android-sdk-linux")
  endif()
endif()

# android
set(WITH_NDK_PATH CACHE STRING "path to NDK (only for android)")
set(WITH_NDK_API 21 CACHE STRING "NDK API level (only for android")

if(CORE_PLATFORM_NAME_LC STREQUAL android)
  if(NOT IS_ABSOLUTE ${WITH_NDK_PATH})
    message(FATAL_ERROR "WITH_NDK_PATH must be an absolute path. For example -DWITH_NDK_PATH=/opt/android-tools/android-ndk-r20")
  endif()

  if(NOT EXISTS ${WITH_NDK_PATH}/sources/android/native_app_glue/android_native_app_glue.h)
    message(FATAL_ERROR "WITH_NDK_PATH is invalid. For example -DWITH_NDK_PATH=/opt/android-tools/android-ndk-r20")
  endif()

  if(NOT EXISTS ${WITH_SDK_PATH}/tools/bin/sdkmanager)
    message(FATAL_ERROR "WITH_SDK_PATH is invalid. For example -WITH_SDK_PATH=/opt/android-tools/android-sdk-linux")
  endif()

  file(GLOB BUILD_TOOLS_VERSION_LIST "${WITH_SDK_PATH}/build-tools/*")
  list(REVERSE BUILD_TOOLS_VERSION_LIST)
  list(GET BUILD_TOOLS_VERSION_LIST 0 BUILD_TOOLS_VERSION)
  get_filename_component(BUILD_TOOLS_VERSION ${BUILD_TOOLS_VERSION} NAME)

  set(SDK_BUILDTOOLS_PATH ${WITH_SDK_PATH}/build-tools/${BUILD_TOOLS_VERSION} CACHE FILEPATH "SDK build tools path" FORCE)
endif()

# todo: do we need this???

# AC_PATH_PROG(AAPT,aapt,"no",$build_tools_path)
# if test "x$AAPT" = "xno" ; then
#   AC_MSG_ERROR("Missing program: aapt")
# fi

# AC_PATH_PROG(DX,dx,"no",$build_tools_path)
# if test "x$DX" = "xno" ; then
#   AC_MSG_ERROR("Missing program: dx")
# fi

# AC_PATH_PROG(ZIPALIGN,zipalign,"no",$build_tools_path)
# if test "x$ZIPALIGN" = "xno" ; then
#   AC_MSG_ERROR("Missing program: zipalign")
# fi

# linux
set(WITH_RENDERSYSTEM CACHE STRING "Render system to use")

if(CORE_PLATFORM_NAME_LC IN_LIST VALID_LINUX_PLATFORMS_LIST)
  if(NOT WITH_RENDERSYSTEM)
    message(FATAL_ERROR "Render system must be specified when using ${CORE_PLATFORM_NAME_LC}. For example -DWITH_RENDERSYSTEM=gles")
  endif()

  if(NOT WITH_RENDERSYSTEM IN_LIST VALID_RENDERSYSTEMS_LIST)
    message(FATAL_ERROR "Specified render system is not valid. For example -DWITH_RENDERSYSTEM=gles")
  endif()
endif()

# RPi
set(WITH_FIRMWARE CACHE STRING "Platform specific firmware location")

if(CORE_PLATFORM_NAME_LC STREQUAL rbpi)
  if(NOT WITH_FIRMWARE)
    message(FATAL_ERROR "Firmware location must be specified when using ${CORE_PLATFORM_NAME_LC}. For example -DWITH_FIRMWARE=/opt/firmware")
  endif()

  if(NOT IS_ABSOLUTE ${WITH_FIRMWARE})
    message(FATAL_ERROR "WITH_FIRMWARE must be an absolute path. For example -DWITH_FIRMWARE=/opt/firmware")
  endif()
endif()
