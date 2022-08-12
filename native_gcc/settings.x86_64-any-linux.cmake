# Toolchain file for
#
#                                              the NATIVE GCC
#
# for building for
#
#                the LOCAL HOST, which is expected to be an x64 running LINUX.
#
# ----------------------------------------------------------------------------------------------------------------------
#
# This is intended to be INCLUDED from the top-level CMakeLists.txt file.
# This is NOT intended to be passed as a toolchain description file to cmake during project configuration.
#
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(${CMAKE_CURRENT_LIST_DIR}/../utils.cmake)

# ------------------------------
# Check environment and settings
# ------------------------------
Validate_CMAKE_BUILD_TYPE_is_custom()

if(CMAKE_CROSSCOMPILING)
  message(FATAL_ERROR "Attempt to cross compile detected.\n"
                      "This project is intended to be build for the native (linux x64) host.")
endif()

if(NOT CMAKE_COMPILER_IS_GNUCXX)
  message(FATAL_ERROR "Compiler other than GCC detected.\n"
                      "This project is intended to be compiled using the GCC compiler.")
endif()

if(NOT CMAKE_SYSTEM_NAME STREQUAL "Linux")
  message(FATAL_ERROR "Target operating system other than Linux detected.\n"
                      "This project is intended to be build for a native Linux system.")
endif()


###############################################################
# Global compiler options related to debugging and optimization
###############################################################
# CMAKE_BUILD_TYPE=custom_debug
list(APPEND compiler_options_debug   "-O0" "-g")
list(APPEND compiler_defines_debug   "")

# CMAKE_BUILD_TYPE=custom_release
list(APPEND compiler_options_release "-O3")
list(APPEND compiler_defines_release "NDEBUG")

###############################################################
# Global compiler options related to errors and warnings
###############################################################
list(APPEND compiler_options_warn_and_err_c   "-Wall"
                                              "-Wextra"
                                              "-Wstrict-prototypes")

list(APPEND compiler_options_warn_and_err_cxx "-Wall"
                                              "-Wextra")

###############################################################
# Global compiler options related to ABI and general stuff
###############################################################
# Options for ASM only
list(APPEND compiler_options_asm "")

# Options for C only
list(APPEND compiler_options_c   "")

# Options for C++ only
list(APPEND compiler_options_cxx "")

# Options for all languages (ASM, C, C++)
list(APPEND compiler_options_all "")

# Defines for ASM only
list(APPEND compiler_defines_asm "")

# Defines for C only
list(APPEND compiler_defines_c   "")

# Defines for C++ only
list(APPEND compiler_defines_cxx "")

# Defines for all languages (ASM, C, C++)
list(APPEND compiler_defines_all "")

# ---------------------------------------------------------------------------------------------------------------------
# Apply configuration
# ---------------------------------------------------------------------------------------------------------------------
add_compile_options("$<$<CONFIG:CUSTOM_DEBUG>:${compiler_options_debug}>"
                    "$<$<NOT:$<CONFIG:CUSTOM_DEBUG>>:${compiler_options_release}>"
                    "$<$<COMPILE_LANGUAGE:ASM>:${compiler_options_asm}>"
                    "$<$<COMPILE_LANGUAGE:C>:${compiler_options_c}>"
                    "$<$<COMPILE_LANGUAGE:C>:${compiler_options_warn_and_err_c}>"
                    "$<$<COMPILE_LANGUAGE:CXX>:${compiler_options_cxx}>"
                    "$<$<COMPILE_LANGUAGE:CXX>:${compiler_options_warn_and_err_cxx}>"
                    "${compiler_options_all}"
                    )

add_compile_definitions("$<$<CONFIG:CUSTOM_DEBUG>:${compiler_defines_debug}>"
                        "$<$<NOT:$<CONFIG:CUSTOM_DEBUG>>:${compiler_defines_release}>"
                        "$<$<COMPILE_LANGUAGE:ASM>:${compiler_defines_asm}>"
                        "$<$<COMPILE_LANGUAGE:C>:${compiler_defines_c}>"
                        "$<$<COMPILE_LANGUAGE:CXX>:${compiler_defines_cxx}>"
                        "${compiler_defines_all}")
