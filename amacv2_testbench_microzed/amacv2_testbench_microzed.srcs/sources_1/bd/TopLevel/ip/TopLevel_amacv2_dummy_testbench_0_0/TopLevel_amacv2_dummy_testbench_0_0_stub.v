// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Wed Mar 28 17:14:38 2018
// Host        : carl-pc running 64-bit CentOS Linux release 7.4.1708 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/kkrizka/Firmware/amacv2_tester/amacv2_testbench_microzed/amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ip/TopLevel_amacv2_dummy_testbench_0_0/TopLevel_amacv2_dummy_testbench_0_0_stub.v
// Design      : TopLevel_amacv2_dummy_testbench_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "amacv2_dummy_testbench_v1_0,Vivado 2017.4" *)
module TopLevel_amacv2_dummy_testbench_0_0(RO_PG_O, OFout, GPO, RESETB, DCDCen, ID, LDx0en, 
  LDx1en, LDx2en, LDy0en, LDy1en, LDy2en, SSSHx, SSSHy, HrstBx, HrstBy, OFin, DCDCadj, GPI, LAM, PGOOD, 
  FPGA_CMD_IN_P, FPGA_CMD_IN_N, FPGA_CMD_OUT_P, FPGA_CMD_OUT_N, FPGA_HVOSC0, FPGA_HVOSC1, 
  FPGA_HVOSC2, FPGA_HVOSC3, FPGA_CLKOUT, SCLK, SDI, SDO, DPOT_CS0, DPOT_CS1, DPOT_CS2, DAC_CS0, 
  DAC_CS1, ADC_CS0, ADC_CS1, ADC_CS2, FPGA_ADC_CNV, LD_EN_DVDD, LD_EN_DCDC, LD_EN_HV, LD_EN_HI, 
  LD_EN_5, LD_EN_3V3, LD_EN_2V5, LD_EN_1V8, s00_axi_awaddr, s00_axi_awprot, s00_axi_awvalid, 
  s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, s00_axi_wready, 
  s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, s00_axi_arprot, 
  s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, s00_axi_rresp, s00_axi_rvalid, 
  s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="RO_PG_O,OFout,GPO,RESETB,DCDCen,ID[4:0],LDx0en,LDx1en,LDx2en,LDy0en,LDy1en,LDy2en,SSSHx,SSSHy,HrstBx,HrstBy,OFin,DCDCadj,GPI,LAM,PGOOD,FPGA_CMD_IN_P,FPGA_CMD_IN_N,FPGA_CMD_OUT_P,FPGA_CMD_OUT_N,FPGA_HVOSC0,FPGA_HVOSC1,FPGA_HVOSC2,FPGA_HVOSC3,FPGA_CLKOUT,SCLK,SDI,SDO,DPOT_CS0,DPOT_CS1,DPOT_CS2,DAC_CS0,DAC_CS1,ADC_CS0,ADC_CS1,ADC_CS2,FPGA_ADC_CNV,LD_EN_DVDD,LD_EN_DCDC,LD_EN_HV,LD_EN_HI,LD_EN_5,LD_EN_3V3,LD_EN_2V5,LD_EN_1V8,s00_axi_awaddr[3:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[3:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  input RO_PG_O;
  input OFout;
  input GPO;
  output RESETB;
  input DCDCen;
  output [4:0]ID;
  input LDx0en;
  input LDx1en;
  input LDx2en;
  input LDy0en;
  input LDy1en;
  input LDy2en;
  output SSSHx;
  output SSSHy;
  input HrstBx;
  input HrstBy;
  output OFin;
  input DCDCadj;
  output GPI;
  input LAM;
  output PGOOD;
  output FPGA_CMD_IN_P;
  output FPGA_CMD_IN_N;
  input FPGA_CMD_OUT_P;
  input FPGA_CMD_OUT_N;
  input FPGA_HVOSC0;
  input FPGA_HVOSC1;
  input FPGA_HVOSC2;
  input FPGA_HVOSC3;
  input FPGA_CLKOUT;
  output SCLK;
  output SDI;
  input SDO;
  output DPOT_CS0;
  output DPOT_CS1;
  output DPOT_CS2;
  output DAC_CS0;
  output DAC_CS1;
  output ADC_CS0;
  output ADC_CS1;
  output ADC_CS2;
  output FPGA_ADC_CNV;
  output LD_EN_DVDD;
  output LD_EN_DCDC;
  output LD_EN_HV;
  output LD_EN_HI;
  output LD_EN_5;
  output LD_EN_3V3;
  output LD_EN_2V5;
  output LD_EN_1V8;
  input [3:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [3:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axi_aclk;
  input s00_axi_aresetn;
endmodule
