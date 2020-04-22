# kodi-depends

   * [Usage](#usage)
   * [Building Kodi](#building-kodi)
   * [Configuration](#configuration)
      * [Required Options](#required-options)
         * [WITH_PREFIX](#with_prefix)
         * [CORE_PLATFORM_NAME](#core_platform_name)
         * [WITH_CPU](#with_cpu)
         * [WITH_HOST](#with_host)
         * [WITH_TARGET](#with_target)
         * [WITH_KODI_SOURCE](#with_kodi_source)
      * [Required Options (android tvos ios osx)](#required-options-android-tvos-ios-osx)
         * [WITH_SDK_PATH](#with_sdk_path)
         * [WITH_SDK_PLATFORM_VERSION](#with_sdk_platform_version)
      * [Required Options (android)](#required-options-android)
         * [WITH_NDK_PATH](#with_ndk_path)
         * [WITH_NDK_API](#with_ndk_api)
      * [Required Options (gbm wayland x11 rbpi)](#required-options-gbm-wayland-x11-rbpi)
         * [WITH_TOOLCHAIN](#with_toolchain)
      * [Required Options (gbm wayland x11)](#required-options-gbm-wayland-x11)
         * [WITH_RENDERSYSTEM](#with_rendersystem)
      * [Required Options (rbpi)](#required-options-rbpi)
         * [WITH_FIRMWARE](#with_firmware)
      * [Optional Options](#optional-options)
         * [WITH_ARCHIVES](#with_archives)
         * [ENABLE_CCACHE](#enable_ccache)
         * [ENABLE_GPLV3](#enable_gplv3)
         * [ENABLE_CONSOLE_LOGGING](#enable_console_logging)
         * [WITH_TARGET_CFLAGS](#with_target_cflags)
         * [WITH_TARGET_CXXFLAGS](#with_target_cxxflags)
         * [WITH_TARGET_LDFLAGS](#with_target_ldflags)
         * [WITH_FFMPEG_OPTIONS](#with_ffmpeg_options)
      * [Other Useful Options](#other-useful-options)
         * [CMAKE_VERBOSE_MAKEFILE](#cmake_verbose_makefile)
         * [CMAKE_MESSAGE_LOG_LEVEL](#cmake_message_log_level)
         * [CMAKE_BUILD_TYPE](#cmake_build_type)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)


A cmake based depends build system for Kodi.

# Usage

arm-linux:
```
mkdir -p build && cd build

cmake -DWITH_TARGET=arm-linux-gnueabi
      -DWITH_HOST=x86_64-redhat-linux
      -DWITH_TOOLCHAIN=/usr/arm-linux-gnueabi
      -DWITH_TARGET_LDFLAGS="-L/usr/arm-linux-gnueabi/sys-root/lib"
      -DWITH_TARGET_CFLAGS="-fPIC -mcpu=cortex-a7 -mfloat-abi=soft -mfpu=neon-vfpv4 -pipe -mabi=aapcs-linux -Wno-psabi"
      -DWITH_PREFIX=/home/lukas/Documents/git/kodi-depends/depends
      -DWITH_ARCHIVES=/home/lukas/Documents/git/kodi-depends/kodi-archives
      -DCORE_PLATFORM_NAME=gbm
      -DWITH_RENDERSYSTEM=gles
      -DWITH_CPU=armeabi-v7a
      -DWITH_KODI_SOURCE=/home/lukas/Documents/git/xbmc
      -DENABLE_GPLV3=ON
      -DENABLE_CONSOLE_LOGGING=OFF
      ..

make -j<n>
```



arm64-android:
```
mkdir -p build-android && cd build-android

cmake -DWITH_TARGET=aarch64-linux-android
      -DWITH_HOST=x86_64-redhat-linux
      -DWITH_PREFIX=/home/lukas/Documents/git/kodi-depends/depends-android
      -DWITH_ARCHIVES=/home/lukas/Documents/git/kodi-depends/kodi-archives
      -DCORE_PLATFORM_NAME=android
      -DWITH_CPU=arm64-v8a
      -DWITH_KODI_SOURCE=/home/lukas/Documents/git/xbmc
      -DENABLE_CONSOLE_LOGGING=OFF
      -DWITH_NDK_PATH=/home/lukas/android-tools/android-ndk-r21b
      -DWITH_SDK_PATH=/home/lukas/android-tools/android-sdk-linux
      -DWITH_NDK_API=21
      ..

make -j<n>
```


# Building Kodi

```
cmake -DCMAKE_TOOLCHAIN_FILE=../kodi-depends/build/Toolchain.cmake
      ..
```

# Configuration

## Required Options

### WITH_PREFIX

Prefix path to install depends.
```
-DWITH_PREFIX=/home/lukas/Documents/git/kodi-depends/depends
```

### CORE_PLATFORM_NAME

Target platform. Valid options: `wayland gbm x11 rbpi android osx ios tvos`
```
-DCORE_PLATFORM_NAME=gbm
```

### WITH_CPU

Target CPU
```
-DWITH_CPU=armeabi-v7a
```

### WITH_HOST

Host OS triplet
```
-DWITH_HOST=x86_64-redhat-linux
```

### WITH_TARGET

Target OS triplet
```
-DWITH_TARGET=arm-linux-gnueabi
```

### WITH_KODI_SOURCE

Path to kodi source (needed for TexturePacker)
```
-DWITH_KODI_SOURCE=/home/lukas/Documents/git/xbmc
```

## Required Options (android tvos ios osx)

### WITH_SDK_PATH

Path to SDK
```
-DWITH_SDK_PATH=
```

### WITH_SDK_PLATFORM_VERSION

SDK platform version
```
-DWITH_SDK_PLATFORM_VERSION=
```

## Required Options (android)

### WITH_NDK_PATH

Path to NDK
```
-DWITH_NDK_PATH=
```

### WITH_NDK_API

NDK API level
```
-DWITH_NDK_API=21
```

## Required Options (gbm wayland x11 rbpi)

### WITH_TOOLCHAIN

Path to toolchain
```
-DWITH_TOOLCHAIN=/usr/arm-linux-gnueabi
```

## Required Options (gbm wayland x11)

### WITH_RENDERSYSTEM

Render system to use
```
-DWITH_RENDERSYSTEM=gles
```

## Required Options (rbpi)

### WITH_FIRMWARE

Platform specific firmware location
```
-DWITH_FIRMWARE=
```

## Optional Options

### WITH_ARCHIVES

Path to tarball download location
```
-DWITH_ARCHIVES=/home/lukas/Documents/git/kodi-depends/kodi-archives
```

### ENABLE_CCACHE

Enable building with ccache support
```
-DENABLE_CCACHE=ON
```

### ENABLE_GPLV3

Enable building GPLv3 components
```
-DENABLE_GPLV3=ON
```

### ENABLE_CONSOLE_LOGGING

Enable console output when building dependencies (not logs files will be created)
```
-DENABLE_CONSOLE_LOGGING=OFF
```

### WITH_TARGET_CFLAGS

C compiler flags (target)
```
-DWITH_TARGET_CFLAGS="-fPIC -mcpu=cortex-a7 -mfloat-abi=soft -mfpu=neon-vfpv4 -pipe -mabi=aapcs-linux -Wno-psabi"
```

### WITH_TARGET_CXXFLAGS

C++ compiler flags (target). `WITH_TARGET_CFLAGS` are copied to CXXFLAGS (no need to duplicate)
```
-DWITH_TARGET_CXXFLAGS=
```

### WITH_TARGET_LDFLAGS

linker flags (target)
```
-DWITH_TARGET_LDFLAGS="-L/usr/arm-linux-gnueabi/sys-root/lib"
```

### WITH_FFMPEG_OPTIONS

FFmpeg configure options (target)
```
-DWITH_FFMPEG_OPTIONS="--enable-vaapi --enable-vdpau"
```


## Other Useful Options

### CMAKE_VERBOSE_MAKEFILE

Enable verbose output from Makefile builds.
```
-DCMAKE_VERBOSE_MAKEFILE=ON
```

### CMAKE_MESSAGE_LOG_LEVEL

Specifies the logging level used by the message() command
```
-DCMAKE_MESSAGE_LOG_LEVEL=VERBOSE
```

### CMAKE_BUILD_TYPE

Specifies the build type. `Debug` or `Release`. Default is `Debug`
```
-DCMAKE_BUILD_TYPE=Release
```
