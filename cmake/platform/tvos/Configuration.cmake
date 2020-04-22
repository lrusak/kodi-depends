include(cmake/platform/darwin_embedded/Configuration.cmake)

list(APPEND WITH_TARGET_CFLAGS "-fembed-bitcode -mappletvos-version-min=11.0")
list(APPEND WITH_TARGET_CXXFLAGS "-fembed-bitcode -mappletvos-version-min=11.0")
list(APPEND WITH_TARGET_LDFLAGS "-mappletvos-version-min=11.0")
