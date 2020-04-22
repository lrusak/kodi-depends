cmake_minimum_required(VERSION 3.4)

project(Kodi-depends NONE)

cmake_policy(SET CMP0074 NEW)

if(NOT WITH_KODI_DEPENDS)
  set(WITH_KODI_DEPENDS ${PROJECT_SOURCE_DIR})
endif()

include(cmake/DefaultURL.cmake)

include(cmake/ValidPlatforms.cmake)

include(cmake/TargetPlatform.cmake)

include(cmake/ParseOptions.cmake)

include(cmake/CreateConfiguration.cmake)

include(cmake/CmakeFlags.cmake)

include(cmake/ToolchainSetup.cmake)

include(cmake/PrintConfiguration.cmake)

include(cmake/Macros.cmake)

include(cmake/ParseDepends.cmake)
