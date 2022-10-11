# toolchain_configs
Native and cross-build toolchain configuration files for cmake.

# Usage
## Cross-build toolchain files
Naming scheme:

`toolchain.<gcc target triplet>.[<OS>].<CPU>.cmake`

Select an appropriate toolchain file and select a toolchain version and pass both to CMake during initial configuration:

```
$ cmake -S <source folder> \
        -B <build folder> \
        -DTOOLCHAIN_VERSION=<toolchain version> \
        -DCMAKE_TOOLCHAIN_FILE=<toolchain-file> \
        -DCMAKE_BUILD_TYPE=<custom_debug | custom_release>
```

Toolchain files may be based on each other via `include()` in order to add some stuff, e.g. a `#define` required by an
operating system.

## Cross-toolchain location
Finally all toolchain files end up including a file like this:

`toolchain.<gcc target triplet>.cmake`

This final file contains the path to the toolchain. Ensure that your toolchain is installed in that folder.

## Native settings files
Native settings files do not specify a toolchain. They are intended to be used with the host's native GCC toolchain.

Naming scheme:

`settings.<gcc target triplet>.cmake`

Select an appropriate settings file and include it in your project's `CMakeLists.txt` file. You must not pass the file
as a toolchain file to CMake during initial configuration, but you have to pass the build type:

```
$ cmake -S <source folder> \
        -B <build folder> \
        -DCMAKE_BUILD_TYPE=<custom_debug | custom_release>
```
