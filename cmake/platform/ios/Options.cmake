set(PLATFORM_NAME iphoneos)

include(cmake/platform/darwin/Options.cmake)

set(WITH_CPU arm64 CACHE STRING "")

set(WITH_HOST x86_64-apple-darwin CACHE STRING "")
set(WITH_TARGET aarch64-apple-darwin CACHE STRING "")
