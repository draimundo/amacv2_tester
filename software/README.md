# AMACv2 Test Software

Software for controlling the AMACv2 test bench.

## Compilation
If using [PetaLinux](https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html), make sure that have the build tools and CMake installed. To enable the [CMake Yocto recipe](https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-devtools/cmake), append the following at the end of `./build/misc/rootfs_config/Kconfig.user`.
```
menu "user packages " 
config cmake  
         bool "cmake"
         help
endmenu
```

Enable the following packages when running `petalinux-config -c rootfs`.
```
-> Filesystem Packages
  -> misc
    -> [*] packagegroup-core-buildessential
-> user packages
  -> [*] cmake
```

The AMACv2 software can then be compiled directly on the ARM core.
```
git clone https://gitlab.cern.ch/berkeleylab/amacv2_tester.git
cd amacv2_tester
mkdir build
cd build
cmake ..
make
```
## Organization
All of the source code is stored inside the `src/` directory. Inside it is organized into directories as follows:
* `devcom/` contains the communication library to for generic protocols (I2C, SPI, UIO...) and the implemenation for controlling several generic devices (DACs, climate sensors...).
* `amac/` contains a library for controlling the AMACv2 testbench and the chip itself.
* `tools/` contains useful programs implementing functions from `devcom` for testing chips.
* `tests/` contains AMACv2 test programs.
* `play/` contains programs for testing the libraries during development. They are not guaranteed to work long-term.
