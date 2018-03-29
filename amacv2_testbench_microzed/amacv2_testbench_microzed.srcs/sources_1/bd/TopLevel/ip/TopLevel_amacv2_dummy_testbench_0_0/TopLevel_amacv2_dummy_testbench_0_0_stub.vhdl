-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Wed Mar 28 17:14:38 2018
-- Host        : carl-pc running 64-bit CentOS Linux release 7.4.1708 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/kkrizka/Firmware/amacv2_tester/amacv2_testbench_microzed/amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ip/TopLevel_amacv2_dummy_testbench_0_0/TopLevel_amacv2_dummy_testbench_0_0_stub.vhdl
-- Design      : TopLevel_amacv2_dummy_testbench_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TopLevel_amacv2_dummy_testbench_0_0 is
  Port ( 
    RO_PG_O : in STD_LOGIC;
    OFout : in STD_LOGIC;
    GPO : in STD_LOGIC;
    RESETB : out STD_LOGIC;
    DCDCen : in STD_LOGIC;
    ID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    LDx0en : in STD_LOGIC;
    LDx1en : in STD_LOGIC;
    LDx2en : in STD_LOGIC;
    LDy0en : in STD_LOGIC;
    LDy1en : in STD_LOGIC;
    LDy2en : in STD_LOGIC;
    SSSHx : out STD_LOGIC;
    SSSHy : out STD_LOGIC;
    HrstBx : in STD_LOGIC;
    HrstBy : in STD_LOGIC;
    OFin : out STD_LOGIC;
    DCDCadj : in STD_LOGIC;
    GPI : out STD_LOGIC;
    LAM : in STD_LOGIC;
    PGOOD : out STD_LOGIC;
    FPGA_CMD_IN_P : out STD_LOGIC;
    FPGA_CMD_IN_N : out STD_LOGIC;
    FPGA_CMD_OUT_P : in STD_LOGIC;
    FPGA_CMD_OUT_N : in STD_LOGIC;
    FPGA_HVOSC0 : in STD_LOGIC;
    FPGA_HVOSC1 : in STD_LOGIC;
    FPGA_HVOSC2 : in STD_LOGIC;
    FPGA_HVOSC3 : in STD_LOGIC;
    FPGA_CLKOUT : in STD_LOGIC;
    SCLK : out STD_LOGIC;
    SDI : out STD_LOGIC;
    SDO : in STD_LOGIC;
    DPOT_CS0 : out STD_LOGIC;
    DPOT_CS1 : out STD_LOGIC;
    DPOT_CS2 : out STD_LOGIC;
    DAC_CS0 : out STD_LOGIC;
    DAC_CS1 : out STD_LOGIC;
    ADC_CS0 : out STD_LOGIC;
    ADC_CS1 : out STD_LOGIC;
    ADC_CS2 : out STD_LOGIC;
    FPGA_ADC_CNV : out STD_LOGIC;
    LD_EN_DVDD : out STD_LOGIC;
    LD_EN_DCDC : out STD_LOGIC;
    LD_EN_HV : out STD_LOGIC;
    LD_EN_HI : out STD_LOGIC;
    LD_EN_5 : out STD_LOGIC;
    LD_EN_3V3 : out STD_LOGIC;
    LD_EN_2V5 : out STD_LOGIC;
    LD_EN_1V8 : out STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end TopLevel_amacv2_dummy_testbench_0_0;

architecture stub of TopLevel_amacv2_dummy_testbench_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "RO_PG_O,OFout,GPO,RESETB,DCDCen,ID[4:0],LDx0en,LDx1en,LDx2en,LDy0en,LDy1en,LDy2en,SSSHx,SSSHy,HrstBx,HrstBy,OFin,DCDCadj,GPI,LAM,PGOOD,FPGA_CMD_IN_P,FPGA_CMD_IN_N,FPGA_CMD_OUT_P,FPGA_CMD_OUT_N,FPGA_HVOSC0,FPGA_HVOSC1,FPGA_HVOSC2,FPGA_HVOSC3,FPGA_CLKOUT,SCLK,SDI,SDO,DPOT_CS0,DPOT_CS1,DPOT_CS2,DAC_CS0,DAC_CS1,ADC_CS0,ADC_CS1,ADC_CS2,FPGA_ADC_CNV,LD_EN_DVDD,LD_EN_DCDC,LD_EN_HV,LD_EN_HI,LD_EN_5,LD_EN_3V3,LD_EN_2V5,LD_EN_1V8,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "amacv2_dummy_testbench_v1_0,Vivado 2017.4";
begin
end;
