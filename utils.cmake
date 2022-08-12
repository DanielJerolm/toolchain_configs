# ---------------------------------------------------------------------------------------------------------------------
# Build type (CMAKE_BUILD_TYPE) related stuff
# ---------------------------------------------------------------------------------------------------------------------
set(CMAKE_BUILD_TYPE_buildin_values "debug;release;RelWithDebInfo;MinSizeRel")
set(CMAKE_BUILD_TYPE_custom_values "custom_debug;custom_release")

string(REPLACE ";"  ", " CMAKE_BUILD_TYPE_buildin_values_str "${CMAKE_BUILD_TYPE_buildin_values}")
string(REPLACE ";"  ", " CMAKE_BUILD_TYPE_custom_values_str "${CMAKE_BUILD_TYPE_custom_values}")

function(Validate_CMAKE_BUILD_TYPE_is_buildin)
  # Validates build type: CMAKE_BUILD_TYPE must be one of the build-ins known by cmake

  if((NOT DEFINED CMAKE_BUILD_TYPE) OR ("${CMAKE_BUILD_TYPE}" STREQUAL ""))
    message(FATAL_ERROR "CMAKE_BUILD_TYPE has not been set!\n"
                        "Pass -DCMAKE_BUILD_TYPE=... to cmake when configuring the project or use the cmake gui!\n"
                        "Allowed values: ${CMAKE_BUILD_TYPE_buildin_values_str}")
  elseif(NOT (${CMAKE_BUILD_TYPE} IN_LIST CMAKE_BUILD_TYPE_buildin_values))
    message(FATAL_ERROR "CMAKE_BUILD_TYPE has an unknown or invalid value!\n"
                        "Pass -DCMAKE_BUILD_TYPE=... to cmake when configuring the project or use the cmake gui!\n"
                        "Allowed values: ${CMAKE_BUILD_TYPE_buildin_values_str}")
  endif()
endfunction()

function(Validate_CMAKE_BUILD_TYPE_is_custom)
  # Validates build type: CMAKE_BUILD_TYPE must be one of the custom values defined by us

  if((NOT DEFINED CMAKE_BUILD_TYPE) OR ("${CMAKE_BUILD_TYPE}" STREQUAL ""))
    message(FATAL_ERROR "CMAKE_BUILD_TYPE has not been set!\n"
                        "Pass -DCMAKE_BUILD_TYPE=... to cmake when configuring the project or use the cmake gui!\n"
                        "Allowed values: ${CMAKE_BUILD_TYPE_custom_values}")
  elseif(NOT (${CMAKE_BUILD_TYPE} IN_LIST CMAKE_BUILD_TYPE_custom_values))
    message(FATAL_ERROR "CMAKE_BUILD_TYPE has an unknown or invalid value!\n"
                        "Pass -DCMAKE_BUILD_TYPE=... to cmake when configuring the project or use the cmake gui!\n"
                        "Allowed values: ${CMAKE_BUILD_TYPE_custom_values}")
  endif()
endfunction()
