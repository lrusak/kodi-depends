set(PLATFORM_NAME macosx)

include(cmake/platform/darwin/Options.cmake)

set(WITH_CPU x86_64 CACHE STRING "")

set(WITH_HOST x86_64-apple-darwin CACHE STRING "")
set(WITH_TARGET x86_64-apple-darwin CACHE STRING "")
