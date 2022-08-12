# Toolchain file for
#
#                    an GCC with target triplet "arm-none-eabi" and threading model "POSIX"
#
# for building for
#
#                a Cortex-M7 CPU with soft-fp, newlib nano, with RTOS (POSIX) present, and with C++ support.
#
# ----------------------------------------------------------------------------------------------------------------------
#
# Intended use
# ------------
#
# This file can be used to build static libraries and monolitic executable images.
#
# This file is intended to be passed to cmake during project configuration:
# cmake -S <source folder> -B <build folder>
#       -DCMAKE_TOOLCHAIN_FILE=toolchain_configs/cross_gcc/settings.arm-none-eabi-posix.cortex-m7+nofp.cmake
#
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m7+nofp)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(${CMAKE_CURRENT_LIST_DIR}/../utils.cmake)

###############################################################
# Global compiler options related to debugging and optimization
###############################################################
# CMAKE_BUILD_TYPE=custom_debug
list(APPEND compiler_options_debug   "-Og" "-g")
list(APPEND compiler_defines_debug   "")

# CMAKE_BUILD_TYPE=custom_release
list(APPEND compiler_options_release "-Os")
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
# Global compiler options related to target CPU configuration
###############################################################
list(APPEND target_cpu_conf "-mcpu=cortex-m7+nofp"
                            "-mthumb")

list(APPEND target_vfp_conf "-mfloat-abi=soft")

###############################################################
# Global compiler options related to ABI and general stuff
###############################################################
# Options for ASM only
list(APPEND compiler_options_asm "SHELL:-x assembler-with-cpp")

# Options for C only
list(APPEND compiler_options_c   "")

# Options for C++ only
list(APPEND compiler_options_cxx "-frtti"
                                 "-fexceptions")

# Options for all languages (ASM, C, C++)
list(APPEND compiler_options_all "-mabi=aapcs"
                                 "-fomit-frame-pointer"
                                 "-falign-functions=4"
                                 "-ffunction-sections"
                                 "-fdata-sections"
                                 "-fno-common"
                                 "-mno-sched-prolog")

# newlib specs (all languages and linker)
list(APPEND specs_options        "-specs=nano.specs")

# Defines for ASM only
list(APPEND compiler_defines_asm "")

# Defines for C only
list(APPEND compiler_defines_c   "")

# Defines for C++ only
list(APPEND compiler_defines_cxx "")

# Defines for all languages (ASM, C, C++)
list(APPEND compiler_defines_all "")

# Options for the linker
list(APPEND linker_options       "-Wl,--gc-sections"
                                 "-Wl,--build-id=none"
                                 "-nostartfiles")

# ---------------------------------------------------------------------------------------------------------------------
# Apply configuration
# ---------------------------------------------------------------------------------------------------------------------
add_compile_options("${target_cpu_conf}"
                    "${target_vfp_conf}"
                    "$<$<CONFIG:CUSTOM_DEBUG>:${compiler_options_debug}>"
                    "$<$<NOT:$<CONFIG:CUSTOM_DEBUG>>:${compiler_options_release}>"
                    "$<$<COMPILE_LANGUAGE:ASM>:${compiler_options_asm}>"
                    "$<$<COMPILE_LANGUAGE:C>:${compiler_options_c}>"
                    "$<$<COMPILE_LANGUAGE:C>:${compiler_options_warn_and_err_c}>"
                    "$<$<COMPILE_LANGUAGE:CXX>:${compiler_options_cxx}>"
                    "$<$<COMPILE_LANGUAGE:CXX>:${compiler_options_warn_and_err_cxx}>"
                    "${compiler_options_all}"
                    "${specs_options}"
                    )

add_compile_definitions("$<$<CONFIG:CUSTOM_DEBUG>:${compiler_defines_debug}>"
                        "$<$<NOT:$<CONFIG:CUSTOM_DEBUG>>:${compiler_defines_release}>"
                        "$<$<COMPILE_LANGUAGE:ASM>:${compiler_defines_asm}>"
                        "$<$<COMPILE_LANGUAGE:C>:${compiler_defines_c}>"
                        "$<$<COMPILE_LANGUAGE:CXX>:${compiler_defines_cxx}>"
                        "${compiler_defines_all}")

add_link_options("${target_cpu_conf}"
                 "${target_vfp_conf}"
                 "${linker_options}"
                 "${specs_options}")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.arm-none-eabi-posix.cmake)
