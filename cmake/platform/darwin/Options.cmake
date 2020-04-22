if(NOT WITH_PREFIX)
  set(WITH_PREFIX "/Users/Shared/xbmc-depends/kodi-depends/${PLATFORM_NAME}" CACHE STRING "")
endif()

if(NOT WITH_ARCHIVES)
  set(WITH_ARCHIVES "/Users/Shared/xbmc-depends/kodi-archives" CACHE STRING "")
endif()

execute_process(COMMAND bash -c "xcode-select -print-path"
                OUTPUT_VARIABLE XCODE_PATH
                OUTPUT_STRIP_TRAILING_WHITESPACE)

execute_process(COMMAND bash -c "${XCODE_PATH}/usr/bin/xcodebuild -showsdks | grep ${PLATFORM_NAME} | sort | tail -n 1 | awk '{ print $2}'"
                OUTPUT_VARIABLE SDK_VER
                OUTPUT_STRIP_TRAILING_WHITESPACE)

execute_process(COMMAND bash -c "${XCODE_PATH}/usr/bin/xcodebuild -version -sdk ${PLATFORM_NAME}${SDK_VER} | grep ^Path | awk '{ print $2}'"
                OUTPUT_VARIABLE SDK_PATH
                OUTPUT_STRIP_TRAILING_WHITESPACE)

# Workaround for libtool adding bind_at_load ld flag via libtoolise/autoreconf
# anything >= 10.4 will suffice
set(OSX_DEPLOYMENT_TARGET MACOSX_DEPLOYMENT_TARGET=10.9)

set(WITH_SDK_PLATFORM_VERSION "${SDK_VER}" CACHE STRING "")
set(WITH_SDK_PATH "${SDK_PATH}" CACHE STRING "")
set(WITH_TOOLCHAIN "${XCODE_PATH}/Toolchains/XcodeDefault.xctoolchain" CACHE STRING "")
set(WITH_HOSTTOOLCHAIN "${XCODE_PATH}" CACHE STRING "")
