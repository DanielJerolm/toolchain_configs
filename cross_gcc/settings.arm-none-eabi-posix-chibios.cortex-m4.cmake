# Toolchain file for
#
#                    an GCC with target triplet "arm-none-eabi" and threading model "POSIX"
#
# for building for
#
#                a Cortex-M4 CPU with FPU, newlib nano, with ChibiOS/RT present (FPU in thread and IRQ context),
#                and with C++ support.
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
#       -DCMAKE_TOOLCHAIN_FILE=toolchain_configs/cross_gcc/settings.arm-none-eabi-posix-chibios.cortex-m4.cmake
#

# Defines for all languages (ASM, C, C++)
list(APPEND compiler_defines_all "CORTEX_USE_FPU=1")

include(${CMAKE_CURRENT_LIST_DIR}/settings.arm-none-eabi-posix.cortex-m4.cmake)
