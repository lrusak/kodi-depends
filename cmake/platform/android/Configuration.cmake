set(CMAKE_SYSTEM_NAME Android)
set(CORE_SYSTEM_NAME android)
set(MESON_SYSTEM android)

list(APPEND WITH_TARGET_CFLAGS "-DANDROID -D__ANDROID_API__=${WITH_NDK_API} -fexceptions -funwind-tables -fstack-protector-strong -no-canonical-prefixes -fPIC -DPIC")
list(APPEND WITH_TARGET_CXXFLAGS "-frtti")
list(APPEND WITH_TARGET_LDFLAGS "-Wl,--exclude-libs,libgcc.a -Wl,--exclude-libs,libatomic.a -L${INSTALL_PREFIX_TARGET}/lib/android-${WITH_NDK_API}")

if(WITH_CPU MATCHES "arm64")
  list(APPEND WITH_TARGET_CFLAGS "-march=armv8-a -mtune=cortex-a53")
elseif(WITH_CPU MATCHES "arm")
  list(APPEND WITH_TARGET_CFLAGS "-march=armv7-a -mtune=cortex-a9 -mfloat-abi=softfp -mfpu=neon")
  list(APPEND WITH_TARGET_LDFLAGS "-Wl,--exclude-libs,libunwind.a")
endif()

list(APPEND WITH_TARGET_CFLAGS "-I${INSTALL_PREFIX_TARGET}/include/android-${WITH_NDK_API}")
