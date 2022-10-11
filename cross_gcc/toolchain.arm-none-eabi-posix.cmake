# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
# If a copy of the MPL was not distributed with this file,
# You can obtain one at https://mozilla.org/MPL/2.0/.
#
# Copyright (C) 2022 Daniel Jerolm


########################################################################################################################
#                                                   Toolchain file
########################################################################################################################
#
# Compiler that will be used:
#   GCC (version specified by ${TOOLCHAIN_VERSION}) with target triplet "arm-none-eabi" and threading model "POSIX",
#   located in /opt/gcc-arm-none-eabi-posix-${TOOLCHAIN_VERSION}
#
# Usage:
#   Option 1:
#     Include this file from a top level toolchain file:
#     include(${CMAKE_CURRENT_LIST_DIR}/toolchain.arm-none-eabi-posix.cmake)
#
#   Option 2:
#     Pass this file to cmake during project configuration:
#     cmake -S <source folder> \
#           -B <build folder> \
#           -DTOOLCHAIN_VERSION=<desired version> \
#           -DCMAKE_TOOLCHAIN_FILE=toolchain_configs/cross_gcc/toolchain.arm-none-eabi-posix.cmake
#


# path to toolchain
set(TOOLCHAIN_PATH_N_PREFIX "/opt/gcc-arm-none-eabi-posix-${TOOLCHAIN_VERSION}")


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
