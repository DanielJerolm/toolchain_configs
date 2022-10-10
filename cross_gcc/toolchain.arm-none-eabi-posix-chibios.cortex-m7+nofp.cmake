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
#   GCC with target triplet "arm-none-eabi" and threading model "POSIX", according to
#   toolchain.arm-none-eabi-posix.cmake
#
# Target CPU:
#   Cortex-M7 with soft-fp
#
# Target OS:
#   ChibiOS/RT
#
# C/C++ libraries:
#   - newlib nano
#   - STL with RTTI and exceptions
#
# Use cases:
#   - Build static libraries
#   - Build monolitic executable images
#
# Usage:
#   This file is intended to be passed to cmake during project configuration:
#   cmake -S <source folder> -B <build folder>
#         -DCMAKE_TOOLCHAIN_FILE=toolchain_configs/cross_gcc/toolchain.arm-none-eabi-posix-chibios.cortex-m7+nofp.cmake
#



# Defines for all languages (ASM, C, C++)
list(APPEND compiler_defines_all "CORTEX_USE_FPU=0")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.arm-none-eabi-posix.cortex-m7+nofp.cmake)
