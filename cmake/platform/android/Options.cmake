set(ANDROID_TOOLCHAIN linux-x86_64)
set(WITH_TOOLCHAIN "${WITH_NDK_PATH}/toolchains/llvm/prebuilt/${ANDROID_TOOLCHAIN}" CACHE STRING "")
set(WITH_HOSTTOOLCHAIN ${WITH_TOOLCHAIN} CACHE STRING "")