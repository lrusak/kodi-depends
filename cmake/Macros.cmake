include(ExternalProject)

function(set_environment)

  if(BUILD_NAME STREQUAL HOST)
    set(CMAKE_C_FLAGS "-I${INSTALL_PREFIX_HOST}/include")
    set(CMAKE_CXX_FLAGS "-I${INSTALL_PREFIX_HOST}/include")
    set(CMAKE_EXE_LINKER_FLAGS "-L${INSTALL_PREFIX_HOST}/lib")
  endif()

  string(REPLACE ";" " " ${BUILD_NAME}_CFLAGS "${CMAKE_C_FLAGS} ${PKG_BUILD_CFLAGS_${BUILD_NAME}}")
  string(STRIP ${${BUILD_NAME}_CFLAGS} ${BUILD_NAME}_CFLAGS)

  string(REPLACE ";" " " ${BUILD_NAME}_CXXFLAGS "${CMAKE_CXX_FLAGS} ${PKG_BUILD_CFLAGS_${BUILD_NAME}}")
  string(STRIP ${${BUILD_NAME}_CXXFLAGS} ${BUILD_NAME}_CXXFLAGS)

  string(REPLACE ";" " " ${BUILD_NAME}_CPPFLAGS "${CMAKE_C_FLAGS} ${PKG_BUILD_CFLAGS_${BUILD_NAME}}")
  string(STRIP ${${BUILD_NAME}_CPPFLAGS} ${BUILD_NAME}_CPPFLAGS)

  string(REPLACE ";" " " ${BUILD_NAME}_LDFLAGS "${CMAKE_EXE_LINKER_FLAGS} ${PKG_BUILD_LDFLAGS_${BUILD_NAME}}")
  string(STRIP ${${BUILD_NAME}_LDFLAGS} ${BUILD_NAME}_LDFLAGS)

  set(BUILD_ENV_TARGET env
                       CC=${TARGET_CC}
                       CXX=${TARGET_CXX}
                       CPP=${TARGET_CPP}
                       LD=${TARGET_LD}
                       AS=${TARGET_AS}
                       AR=${TARGET_AR}
                       NM=${TARGET_NM}
                       RANLIB=${TARGET_RANLIB}
                       OBJCOPY=${TARGET_OBJCOPY}
                       OBJDUMP=${TARGET_OBJDUMP}
                       STRIP=${TARGET_STRIP}

                       CFLAGS=${TARGET_CFLAGS}
                       CXXFLAGS=${TARGET_CXXFLAGS}
                       CPPFLAGS=${TARGET_CPPFLAGS}
                       LDFLAGS=${TARGET_LDFLAGS}

                       PATH=${INSTALL_PREFIX_HOST}/bin:$ENV{PATH}

                       AUTOM4TE=${INSTALL_PREFIX_HOST}/bin/autom4te
                       AUTOMAKE=${INSTALL_PREFIX_HOST}/bin/automake
                       AUTOCONF=${INSTALL_PREFIX_HOST}/bin/autoconf
                       ACLOCAL=${INSTALL_PREFIX_HOST}/bin/aclocal
                       ACLOCAL_PATH=${INSTALL_PREFIX_TARGET}/share/aclocal:${INSTALL_PREFIX_HOST}/share/aclocal
                       AUTOPOINT=${INSTALL_PREFIX_HOST}/bin/autopoint
                       AUTOHEADER=${INSTALL_PREFIX_HOST}/bin/autoheader
                       AUTORECONF=${INSTALL_PREFIX_HOST}/bin/autoreconf

                       LIBTOOL=${INSTALL_PREFIX_HOST}/bin/libtool
                       LIBTOOLIZE=${INSTALL_PREFIX_HOST}/bin/libtoolize

                       PKG_CONFIG=${INSTALL_PREFIX_HOST}/bin/pkg-config
                       PKG_CONFIG_PATH=${INSTALL_PREFIX_TARGET}/lib/pkgconfig
                       PKG_CONFIG_LIBDIR=${INSTALL_PREFIX_TARGET}/lib/pkgconfig

                       PYTHONPATH=${INSTALL_PREFIX_TARGET}/share/${APP_NAME}/addons/script.module.pil:${INSTALL_PREFIX_TARGET}/lib/python3.7/site-packages/
                       PYTHONXCPREFIX=${INSTALL_PREFIX_TARGET}

                       HOST_CC=${HOST_CC}
                       HOST_CXX=${HOST_CXX}
                       HOSTCC=${HOST_CC}
                       HOSTCXX=${HOST_CXX}
                       CC_FOR_BUILD=${HOST_CC}
                       CXX_FOR_BUILD=${HOST_CXX}
                       BUILD_CC=${HOST_CC}
                       BUILD_CXX=${HOST_CXX}

                       WITH_SDK_PATH=${WITH_SDK_PATH}
                       ${OSX_DEPLOYMENT_TARGET}

                       PARENT_SCOPE)

  # meson needs a specific env because it uses the cross file
  set(BUILD_ENV_MESON_TARGET env
                             PKG_CONFIG_LIBDIR=${INSTALL_PREFIX_TARGET}/lib/pkgconfig
                             PKG_CONFIG_LIBDIR=${INSTALL_PREFIX_TARGET}/lib/pkgconfig
                             PATH=${INSTALL_PREFIX_HOST}/bin:$ENV{PATH}

                             PARENT_SCOPE)

  set(AUTOTOOLS_CROSS_ARGS_TARGET --build=${WITH_HOST} --host=${WITH_TARGET} PARENT_SCOPE)
  set(CMAKE_TOOLCHAIN_FILE_TARGET -DCMAKE_TOOLCHAIN_FILE=${CMAKE_BINARY_DIR}/Toolchain.cmake PARENT_SCOPE)
  set(MESON_TOOLCHAIN_FILE_TARGET --cross-file ${CMAKE_BINARY_DIR}/cross-file.meson PARENT_SCOPE)

  set(BUILD_ENV_HOST env
                       CFLAGS=${HOST_CFLAGS}
                       CXXFLAGS=${HOST_CXXFLAGS}
                       CPPFLAGS=${HOST_CPPFLAGS}
                       LDFLAGS=${HOST_LDFLAGS}

                       PATH=${INSTALL_PREFIX_HOST}/bin:$ENV{PATH}

                       PARENT_SCOPE)

  set(AUTOTOOLS_CROSS_ARGS_HOST PARENT_SCOPE)
  set(CMAKE_TOOLCHAIN_FILE_HOST PARENT_SCOPE)
  set(MESON_TOOLCHAIN_FILE_HOST PARENT_SCOPE)

  set(MESON_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/meson PARENT_SCOPE)
  set(NINJA_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/ninja PARENT_SCOPE)

  set(MESON_COMMAND_HOST meson PARENT_SCOPE)
  set(NINJA_COMMAND_HOST ninja PARENT_SCOPE)

  # PKG_AUTORECONF ON can only be used after autoconf-host is built
  set(AUTORECONF_COMMAND_TARGET ${INSTALL_PREFIX_HOST}/bin/autoreconf PARENT_SCOPE)
  set(AUTORECONF_COMMAND_HOST autoreconf PARENT_SCOPE)

  set(PATCH_COMMAND_TARGET ${PATCH_COMMAND} PARENT_SCOPE)
  set(PATCH_COMMAND_HOST patch PARENT_SCOPE)

endfunction()

function(add_depends)

  if (NOT PKG_URL)
    set(PKG_URL ${BASE_URL}/${PKG_ARCHIVE})
  endif()

  set_environment()

  if(NOT ENABLE_CONSOLE_LOGGING)
    set(LOG_OUTPUT_AUTORECONF > ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/autoreconf.log 2>&1)
    set(LOG_OUTPUT_CONFIGURE  > ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/configure.log 2>&1)
    set(LOG_OUTPUT_BUILD      > ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/build.log 2>&1)
    set(LOG_OUTPUT_INSTALL    > ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/install.log 2>&1)
  endif()

  if(NOT PKG_MAKE_INSTALL_OPTS_${BUILD_NAME})
    set(PKG_MAKE_INSTALL_OPTS_${BUILD_NAME} install)
  endif()

  if(PKG_TOOLCHAIN STREQUAL "autotools")

    set(PKG_CONFIGURE_COMMAND ${BUILD_ENV_${BUILD_NAME}} ./configure ${AUTOTOOLS_CROSS_ARGS_${BUILD_NAME}} --prefix=${INSTALL_PREFIX_${BUILD_NAME}} --libdir=${INSTALL_PREFIX_${BUILD_NAME}}/lib ${PKG_CONFIGURE_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_CONFIGURE})
    set(PKG_BUILD_COMMAND ${BUILD_ENV_${BUILD_NAME}} $(MAKE) ${PKG_MAKE_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_BUILD})
    set(PKG_INSTALL_COMMAND ${BUILD_ENV_${BUILD_NAME}} $(MAKE) ${PKG_MAKE_INSTALL_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_INSTALL})

    set(PKG_BUILD_IN_SOURCE ON)

  elseif(PKG_TOOLCHAIN STREQUAL "cmake")

    set(PKG_CONFIGURE_COMMAND cmake ${CMAKE_TOOLCHAIN_FILE_${BUILD_NAME}} -DCMAKE_INSTALL_PREFIX=${INSTALL_PREFIX_${BUILD_NAME}} -DCMAKE_INSTALL_LIBDIR=${INSTALL_PREFIX_${BUILD_NAME}}/lib -DCMAKE_CXX_EXTENSIONS=${CMAKE_CXX_EXTENSIONS} -DCMAKE_CXX_STANDARD=${CMAKE_CXX_STANDARD} ${PKG_CMAKE_OPTS_${BUILD_NAME}} <SOURCE_DIR> ${LOG_OUTPUT_CONFIGURE})
    set(PKG_BUILD_COMMAND ${BUILD_ENV_${BUILD_NAME}} $(MAKE) ${PKG_MAKE_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_BUILD})
    set(PKG_INSTALL_COMMAND ${BUILD_ENV_${BUILD_NAME}} $(MAKE) ${PKG_MAKE_INSTALL_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_INSTALL})

    set(PKG_BUILD_IN_SOURCE OFF)

  elseif(PKG_TOOLCHAIN STREQUAL "meson")

    set(PKG_CONFIGURE_COMMAND ${BUILD_ENV_MESON_${BUILD_NAME}} ${MESON_COMMAND_${BUILD_NAME}} ${MESON_TOOLCHAIN_FILE_${BUILD_NAME}} --prefix=${INSTALL_PREFIX_${BUILD_NAME}} ${PKG_MESON_OPTS_${BUILD_NAME}} --libdir=lib <SOURCE_DIR> ${LOG_OUTPUT_CONFIGURE})
    set(PKG_BUILD_COMMAND ${BUILD_ENV_${BUILD_NAME}} ${NINJA_COMMAND_${BUILD_NAME}} -v ${PKG_MAKE_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_BUILD})
    set(PKG_INSTALL_COMMAND ${BUILD_ENV_${BUILD_NAME}} ${NINJA_COMMAND_${BUILD_NAME}} -v ${PKG_MAKE_INSTALL_OPTS_${BUILD_NAME}} ${LOG_OUTPUT_INSTALL})

    set(PKG_BUILD_IN_SOURCE OFF)

  elseif(PKG_TOOLCHAIN STREQUAL "custom")

    set(PKG_CONFIGURE_COMMAND ${BUILD_ENV_${BUILD_NAME}} ${PKG_CONFIGURE_COMMAND_${BUILD_NAME}} ${LOG_OUTPUT_CONFIGURE})
    set(PKG_BUILD_COMMAND ${BUILD_ENV_${BUILD_NAME}} ${PKG_BUILD_COMMAND_${BUILD_NAME}} ${LOG_OUTPUT_BUILD})
    set(PKG_INSTALL_COMMAND ${BUILD_ENV_${BUILD_NAME}} ${PKG_INSTALL_COMMAND_${BUILD_NAME}} ${LOG_OUTPUT_INSTALL})

    set(PKG_BUILD_IN_SOURCE ON)

  elseif(PKG_TOOLCHAIN STREQUAL "virtual")

    add_custom_target(${PKG_NAME}-${BUILD_NAME_LC})

  endif()

  if(PKG_TOOLCHAIN MATCHES "autotools|cmake|meson|custom")

    if(PKG_SOURCE_PATH)
      # only copy once otherwise rerunning cmake will make it copy each time
      if(NOT EXISTS ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/src/${PKG_NAME}-${BUILD_NAME_LC})
        file(GLOB PKG_SOURCE_FILES ${PKG_SOURCE_PATH}/*)
        file(COPY ${PKG_SOURCE_FILES}
             DESTINATION ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/src/${PKG_NAME}-${BUILD_NAME_LC})
        unset(PKG_SOURCE_FILES)
      endif()
      set(EXTERNAL_PROJECT_ARGS SOURCE_DIR ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/src/${PKG_NAME}-${BUILD_NAME_LC})
    else()
      set(EXTERNAL_PROJECT_ARGS URL ${PKG_URL}
                                URL_HASH SHA256=${PKG_SHA256}
                                DOWNLOAD_NAME ${PKG_ARCHIVE}
                                DOWNLOAD_DIR ${WITH_ARCHIVES})
    endif()


    ExternalProject_Add(${PKG_NAME}-${BUILD_NAME_LC}
                        ${EXTERNAL_PROJECT_ARGS}
                        PREFIX ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}
                        CONFIGURE_COMMAND ${PKG_CONFIGURE_COMMAND}
                        BUILD_COMMAND ${PKG_BUILD_COMMAND}
                        INSTALL_COMMAND ${PKG_INSTALL_COMMAND}
                        BUILD_IN_SOURCE ${PKG_BUILD_IN_SOURCE}
                        EXCLUDE_FROM_ALL ON
                        STEP_TARGETS download update patch configure build install)

    if(PKG_TOOLCHAIN STREQUAL "meson" AND BUILD_NAME STREQUAL "TARGET")

      if(NOT TARGET generate-meson-crossfile)
        add_custom_target(generate-meson-crossfile
                          COMMAND sh ${CMAKE_BINARY_DIR}/meson-cross-setup.sh
                          COMMENT "running generate-meson-crossfile")

        # Meson packages cannot generate the crossfile until Python-host is built!
        message(VERBOSE "adding dependency Python-host to target generate-meson-crossfile")
        add_dependencies(generate-meson-crossfile Python-host)
      endif()

      # every meson package needs to depend on generate-meson-crossfile because of the parrallel build
      message(VERBOSE "adding dependency generate-meson-crossfile to target ${PKG_NAME}-${BUILD_NAME_LC}-configure of ${PKG_NAME}-${BUILD_NAME_LC}")
      ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} configure generate-meson-crossfile)

    endif()

    if(PKG_AUTORECONF)
      ExternalProject_Add_Step(${PKG_NAME}-${BUILD_NAME_LC} autoreconf
                               COMMAND ${BUILD_ENV_${BUILD_NAME}} ${AUTORECONF_COMMAND_${BUILD_NAME}} -ivf ${LOG_OUTPUT_AUTORECONF}
                               WORKING_DIRECTORY <SOURCE_DIR>
                               COMMENT "running autoreconf for ${PKG_NAME}-${BUILD_NAME_LC}")

      message(VERBOSE "adding target ${PKG_NAME}-${BUILD_NAME_LC}-autoreconf to ${PKG_NAME}-${BUILD_NAME_LC}")
      ExternalProject_Add_StepTargets(${PKG_NAME}-${BUILD_NAME_LC} autoreconf)

      message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC}-patch to target ${PKG_NAME}-${BUILD_NAME_LC}-autoreconf of ${PKG_NAME}-${BUILD_NAME_LC}")
      ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} autoreconf ${PKG_NAME}-${BUILD_NAME_LC}-patch)

      message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC}-autoreconf to target ${PKG_NAME}-${BUILD_NAME_LC}-configure of ${PKG_NAME}-${BUILD_NAME_LC}")
      ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} configure ${PKG_NAME}-${BUILD_NAME_LC}-autoreconf)

      # Hack, not sure how to handle this better
      if(BUILD_NAME STREQUAL TARGET)
        message(VERBOSE "adding dependency autoconf-host-meta to target ${PKG_NAME}-${BUILD_NAME_LC}-autoreconf of ${PKG_NAME}-${BUILD_NAME_LC}")
        ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} autoreconf autoconf-host-meta)
      endif()
    endif()

    if(PKG_POST_INSTALL_COMMAND_${BUILD_NAME})
      set(INDEX 1)
      set(POST_INSTALL_STEP "install")
      foreach(CUSTOM_COMMAND ${PKG_POST_INSTALL_COMMAND_${BUILD_NAME}})
        set(LOG_OUTPUT_POST_INSTALL > ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/postinstall-${INDEX}.log 2>&1)
        string(REPLACE " " ";" CUSTOM_COMMAND_LIST "${CUSTOM_COMMAND}")
        ExternalProject_Add_Step(${PKG_NAME}-${BUILD_NAME_LC} postinstall-${INDEX}
                                 COMMAND ${CUSTOM_COMMAND_LIST} ${LOG_OUTPUT_POST_INSTALL}
                                 DEPENDEES ${POST_INSTALL_STEP}
                                 WORKING_DIRECTORY <SOURCE_DIR>
                                 COMMENT "running postinstall ${INDEX} for ${PKG_NAME}-${BUILD_NAME_LC}")

        message(VERBOSE "adding target ${PKG_NAME}-${BUILD_NAME_LC}-postinstall-${INDEX} to ${PKG_NAME}-${BUILD_NAME_LC}")
        ExternalProject_Add_StepTargets(${PKG_NAME}-${BUILD_NAME_LC} postinstall-${INDEX})

        message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC}-${POST_INSTALL_STEP} to target ${PKG_NAME}-${BUILD_NAME_LC}-postinstall-${INDEX} of ${PKG_NAME}-${BUILD_NAME_LC}")
        # This doesn't work and seems to break the build. use DEPENDEES ${POST_INSTALL_STEP} instead in ExternalProject_Add_Step
        # ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} postinstall-${INDEX} ${PKG_NAME}-${BUILD_NAME_LC}-${POST_INSTALL_STEP})

        set(POST_INSTALL_STEP postinstall-${INDEX})
        math(EXPR INDEX ${INDEX}+1)
      endforeach()

    endif()

    if(PKG_PATCHES OR PKG_PATCHES_${BUILD_NAME})
      set(PATCH_STEP "${PKG_NAME}-${BUILD_NAME_LC}-update")
      foreach(patch ${PKG_PATCHES} ${PKG_PATCHES_${BUILD_NAME}})
        string(REGEX MATCH "([0-9]*)-.*\.patch" PATCH_NAME ${patch})
        set(LOG_OUTPUT_PATCH > ${BUILD_DIR_${BUILD_NAME}}/${PKG_NAME}/patch-${CMAKE_MATCH_1}.log 2>&1)
        message(VERBOSE "found patch for ${PKG_NAME}: ${PATCH_NAME}")
        message(VERBOSE "patch full path: ${CMAKE_SOURCE_DIR}/packages/${PKG_NAME}/patches/${PATCH_NAME}")
        message(VERBOSE "adding patch step: ${PKG_NAME}-${BUILD_NAME_LC}-patch-${CMAKE_MATCH_1}")
        ExternalProject_Add_Step(${PKG_NAME}-${BUILD_NAME_LC} patch-${CMAKE_MATCH_1}
                                 COMMAND ${PATCH_COMMAND_${BUILD_NAME}} -p1 -i ${WITH_KODI_DEPENDS}/packages/${PKG_NAME}/patches/${PATCH_NAME} ${LOG_OUTPUT_PATCH}
                                 WORKING_DIRECTORY <SOURCE_DIR>
                                 COMMENT "applying patch ${PATCH_NAME}")

        message(VERBOSE "adding target ${PKG_NAME}-${BUILD_NAME_LC}-patch-${CMAKE_MATCH_1} to ${PKG_NAME}-${BUILD_NAME_LC}")
        ExternalProject_Add_StepTargets(${PKG_NAME}-${BUILD_NAME_LC} patch-${CMAKE_MATCH_1})

        message(VERBOSE "adding dependency ${PATCH_STEP} to target ${PKG_NAME}-${BUILD_NAME_LC}-patch-${CMAKE_MATCH_1} of ${PKG_NAME}-${BUILD_NAME_LC}")
        ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} patch-${CMAKE_MATCH_1} ${PATCH_STEP})

        set(PATCH_STEP ${PKG_NAME}-${BUILD_NAME_LC}-patch-${CMAKE_MATCH_1})
      endforeach()

      message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC}-patch-${CMAKE_MATCH_1} to target ${PKG_NAME}-${BUILD_NAME_LC}-configure of ${PKG_NAME}-${BUILD_NAME_LC}")
      ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} patch ${PKG_NAME}-${BUILD_NAME_LC}-patch-${CMAKE_MATCH_1})
    endif()
  endif()

  # Setup targets and dependencies

  if(NOT PKG_TOOLCHAIN STREQUAL virtual)
    if(NOT TARGET ${PKG_NAME}-download)
      add_custom_target(${PKG_NAME}-download)
    endif()

    message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC}-download to target ${PKG_NAME}-download")
    add_dependencies(${PKG_NAME}-download ${PKG_NAME}-${BUILD_NAME_LC}-download)

    if(NOT TARGET download-depends)
      add_custom_target(download-depends
                        COMMENT "custom target to allow downloading external dependencies")
    endif()

    message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC}-download to target download-depends")
    add_dependencies(download-depends ${PKG_NAME}-${BUILD_NAME_LC}-download)
  endif()

  if(NOT TARGET ${PKG_NAME}-${BUILD_NAME_LC}-meta)
    add_custom_target(${PKG_NAME}-${BUILD_NAME_LC}-meta)
  endif()

  message(VERBOSE "adding dependency ${PKG_NAME}-${BUILD_NAME_LC} to target ${PKG_NAME}-${BUILD_NAME_LC}-meta")
  add_dependencies(${PKG_NAME}-${BUILD_NAME_LC}-meta ${PKG_NAME}-${BUILD_NAME_LC})

  foreach(depend ${PKG_DEPENDS_${BUILD_NAME}})
    string(REGEX MATCH "-host|-target" DEPEND_SUFFIX ${depend})

    if(NOT DEPEND_SUFFIX)
      set(depend ${depend}-${BUILD_NAME_LC})
    endif()

    if(NOT TARGET ${depend}-meta)
      add_custom_target(${depend}-meta)
    endif()

    message(VERBOSE "adding dependency ${depend}-meta to target ${PKG_NAME}-${BUILD_NAME_LC}")
    add_dependencies(${PKG_NAME}-${BUILD_NAME_LC} ${depend}-meta)

    if(PKG_AUTORECONF)
      message(VERBOSE "adding dependency ${depend}-meta to target ${PKG_NAME}-${BUILD_NAME_LC}-autoreconf of ${PKG_NAME}-${BUILD_NAME_LC}")
      # not sure if this is needed, should autoreconf run after dependencies are completed?
      ExternalProject_Add_StepDependencies(${PKG_NAME}-${BUILD_NAME_LC} autoreconf ${depend}-meta)
    endif()
  endforeach()

endfunction()

function(add_depends_for_targets build_targets)

  message(STATUS "adding ${PKG_NAME}")

  if(PKG_URL)
    message(VERBOSE "${PKG_NAME} URL: ${PKG_URL}")
  endif()

  foreach(build_target ${build_targets})
    set(BUILD_NAME ${build_target})
    string(TOLOWER ${BUILD_NAME} BUILD_NAME_LC)
    add_depends()
  endforeach()

  unset(PKG_NAME PARENT_SCOPE)
  unset(PKG_SOURCE_PATH PARENT_SCOPE)
  unset(PKG_VERSION PARENT_SCOPE)
  unset(PKG_SHA256 PARENT_SCOPE)
  unset(PKG_ARCHIVE PARENT_SCOPE)
  unset(PKG_URL PARENT_SCOPE)
  unset(PKG_DEPENDS_HOST PARENT_SCOPE)
  unset(PKG_DEPENDS_TARGET PARENT_SCOPE)
  unset(PKG_TOOLCHAIN PARENT_SCOPE)
  unset(PKG_PATCHES PARENT_SCOPE)
  unset(PKG_PATCHES_HOST PARENT_SCOPE)
  unset(PKG_PATCHES_TARGET PARENT_SCOPE)
  unset(PKG_AUTORECONF PARENT_SCOPE)
  unset(PKG_BUILD_CFLAGS_HOST PARENT_SCOPE)
  unset(PKG_BUILD_CFLAGS_TARGET PARENT_SCOPE)
  unset(PKG_BUILD_LDFLAGS_HOST PARENT_SCOPE)
  unset(PKG_BUILD_LDFLAGS_TARGET PARENT_SCOPE)
  unset(PKG_CONFIGURE_OPTS_HOST PARENT_SCOPE)
  unset(PKG_CONFIGURE_OPTS_TARGET PARENT_SCOPE)
  unset(PKG_CMAKE_OPTS_HOST PARENT_SCOPE)
  unset(PKG_CMAKE_OPTS_TARGET PARENT_SCOPE)
  unset(PKG_MESON_OPTS_HOST PARENT_SCOPE)
  unset(PKG_MESON_OPTS_TARGET PARENT_SCOPE)
  unset(PKG_MAKE_OPTS_HOST PARENT_SCOPE)
  unset(PKG_MAKE_OPTS_TARGET PARENT_SCOPE)
  unset(PKG_MAKE_INSTALL_OPTS_HOST PARENT_SCOPE)
  unset(PKG_MAKE_INSTALL_OPTS_TARGET PARENT_SCOPE)
  unset(PKG_CONFIGURE_COMMAND_HOST PARENT_SCOPE)
  unset(PKG_CONFIGURE_COMMAND_TARGET PARENT_SCOPE)
  unset(PKG_BUILD_COMMAND_HOST PARENT_SCOPE)
  unset(PKG_BUILD_COMMAND_TARGET PARENT_SCOPE)
  unset(PKG_INSTALL_COMMAND_HOST PARENT_SCOPE)
  unset(PKG_INSTALL_COMMAND_TARGET PARENT_SCOPE)
  unset(PKG_POST_INSTALL_COMMAND_HOST PARENT_SCOPE)
  unset(PKG_POST_INSTALL_COMMAND_TARGET PARENT_SCOPE)

endfunction()

