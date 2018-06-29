<!-- TITLE: AMACv2 Testing -->
<!-- SUBTITLE: Summary of the tools used for testing the AMACv2 chip -->

# Introduction
The AMACv2 test system is based on a custom active board that is controlled via a [MicroZed Zynq developement board](http://zedboard.org/product/microzed). The connection between the two is accomplished via an FMC connector, for which the [MicroZed Carrier Card](http://zedboard.org/product/microzed-fmc-carrier) is required.

The Processing Logic on the Zynq FPGA implements a few simple IP core blocks connected to the Processing System using the AXI4-Lite interface. The main blocks are:
* Digital I/O block mapping registers to pins 
* Endeavour block for communication with the AMACv2
* Frequency measurement block for testing of the AMACv2 output clocks.
* [AXI Quad SPI](https://www.xilinx.com/support/documentation/ip_documentation/axi_quad_spi/v3_2/pg153-axi-quad-spi.pdf) IP core for control of the chips on the active board (ADCs, DACs, POTs).

The Processing System on the Zynq FPGA runs the [PetaLinux](https://www.xilinx.com/products/design-tools/embedded-software/petalinux-sdk.html) Linux distribution. The software to run the tests is located there. Communication with the custom IP core is implemented using the userspace IO driver. Communication with the SPI IP core is done using the spidev driver.

Version 2018.2 of Vivado and PetaLinux is used.

# Source Code
The firmware/software/documentation for the AMACv2 test system can be found in the [amacv2_tester](https://gitlab.cern.ch/berkeleylab/amacv2_tester) gitlab repository.

```shell
git clone https://:@gitlab.cern.ch:8443/berkeleylab/amacv2_tester.git
```

Continious Integration is run on every commit that compiles the firmware and the PetaLinux project. The output is saved as an artifact.

The contents of the repository are organized as follows:
* `amacv2_testbench_microzed` - Implementation of the firmware for the MicroZed.
* `amacv2_testbench_microzed/amacv2_testbench_microzed.linux` - The PetaLinux project based on the MicroZed.
* `ip_repo` - The custom IP core blocks. Can be reused by other projects with different devices.
* `software` - Software for running the tests.
* `doc` - Documentation of the test system. The active card design is stored here.

# Memory Map
The address space is divded among the different IP blocks used in the top-level firmware entity.

## Digital I/O (0x43C10000 - 0x43C1FFFF)

## Endeavour (0x43C10000 - 0x43C1FFFF)

## Frequency Measurement (0x43C20000 - 0x43C2FFFF `/dev/uio2`)
The frequency measurement bloc is a simple synchronous (to *clk_i*) counter, which reacts on edges (if the signal is slow enough to be detected), with outputs *hi_n_o* and *lo_n_o* counting rising respectively falling edges and also measures the duty cycle of the input signal *frq_i*, with *hi_t_o* incrementing everytime *frq_i* is high and *clk_i* rises. The different *\*_flg_o* outputs monitor the registers, and are active high if an overflow is detected. On the input side, *ts_cnt_i* sets the number of clock cycles during which the measurement is done. *freeze_i*, active high, freezes the ouput registers (the measurement continues in the background) and *nrst_i*, active low, resets the bloc.

For the AMACv2, there are 5 frequencies to be measured : *HVOSC0*->*HVOSC3* and *CLKOUT*, needing each one an instance of the frequency measurement bloc (without the AXI system) these 5 blocs are then mapped to AXI registers following this scheme:

![Frequency Measurment bloc AXI mapping](https://user-images.githubusercontent.com/39920129/42100697-bf6e8c2e-7b75-11e8-993a-8897377ca8d7.png)

## Xilinx Quad SPI (0x41E00000 - 41E0FFFF)
The `spidev` driver should be used for SPI commands instead of direct register access. The device-tree maps the SPI devices on the active board to the following `/dev` nodes.
* `DPOT_CS0` → `/dev/spidev1.0`
* `DPOT_CS1` → `/dev/spidev1.1`
* `DPOT_CS2` → `/dev/spidev1.2`
* `DAC_CS0` → `/dev/spidev1.3`
* `DAC_CS1` → `/dev/spidev1.4`
* `ADC_CS0` → `/dev/spidev1.5`
* `ADC_CS1` → `/dev/spidev1.6`
* `ADC_CS2` → `/dev/spidev1.7`

