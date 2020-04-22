include(cmake/platform/darwin_embedded/Configuration.cmake)

list(APPEND WITH_TARGET_CFLAGS "-miphoneos-version-min=11.0")
list(APPEND WITH_TARGET_CXXFLAGS "-miphoneos-version-min=11.0")
list(APPEND WITH_TARGET_LDFLAGS "-miphoneos-version-min=11.0")
