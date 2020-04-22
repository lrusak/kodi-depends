set(VALID_LINUX_PLATFORMS_LIST wayland gbm x11 CACHE STRING "List of valid linux platforms" FORCE)
set(VALID_PLATFORMS_LIST ${VALID_LINUX_PLATFORMS_LIST} rbpi android osx ios tvos CACHE STRING "List of valid platforms" FORCE)
string(REPLACE ";" " " VALID_PLATFORMS_STRING "${VALID_PLATFORMS_LIST}")

set(VALID_RENDERSYSTEMS_LIST gl gles CACHE STRING "List of valid rendersystems for linux" FORCE)

set(CORE_PLATFORM_NAME CACHE STRING "Target platform")

# Only use CORE_PLATFORM_NAME_LC after here
string(TOLOWER ${CORE_PLATFORM_NAME} CORE_PLATFORM_NAME_LC)

if(NOT CORE_PLATFORM_NAME_LC)
  message(FATAL_ERROR "No platform specified. For example -DCORE_PLATFORM_NAME=android")
endif()

if(NOT CORE_PLATFORM_NAME_LC IN_LIST VALID_PLATFORMS_LIST)
  message(FATAL_ERROR "Specified platform not valid. Valid platforms: ${VALID_PLATFORMS_STRING}")
endif()
