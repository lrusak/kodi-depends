set(CORE_SYSTEM_NAME osx)
set(MESON_SYSTEM darwin)

list(APPEND WITH_TARGET_CFLAGS "-fheinous-gnu-extensions -no-cpp-precomp")
list(APPEND WITH_TARGET_LDFLAGS "-Wl,-search_paths_first -stdlib=libc++")

