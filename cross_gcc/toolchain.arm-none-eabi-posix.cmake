# Toolchain file for an GCC with target triplet "arm-none-eabi" and threading model "POSIX".
# ------------------------------------------------------------------------------------------
#
# You can query the threading model configured at the compiler via "arm-none-eabi-gcc -v".
# Look for "Thread model: posix".
#
# Do not use this directly! This is intended to be included by a settings.arm-none-eabi-posix.*.cmake - file.
#

#######################################
# Path to toolchain
#######################################
set(TOOLCHAIN_PATH_N_PREFIX "/opt/gcc-arm-none-eabi-posix-10.3")


# during compilation test, cmake shall build a static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PATH_N_PREFIX}/bin/arm-none-eabi-gcc")
set(CMAKE_C_COMPILER   "${TOOLCHAIN_PATH_N_PREFIX}/bin/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH_N_PREFIX}/bin/arm-none-eabi-g++")
set(CMAKE_SIZE         "${TOOLCHAIN_PATH_N_PREFIX}/bin/arm-none-eabi-size")
set(CMAKE_OBJCOPY      "${TOOLCHAIN_PATH_N_PREFIX}/bin/arm-none-eabi-objcopy")
set(CMAKE_LINKER       "${TOOLCHAIN_PATH_N_PREFIX}/bin/arm-none-eabi-g++")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
