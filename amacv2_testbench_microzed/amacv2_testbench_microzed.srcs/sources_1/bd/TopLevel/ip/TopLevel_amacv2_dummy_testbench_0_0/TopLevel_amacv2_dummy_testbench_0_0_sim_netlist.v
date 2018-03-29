// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Wed Mar 28 17:14:38 2018
// Host        : carl-pc running 64-bit CentOS Linux release 7.4.1708 (Core)
// Command     : write_verilog -force -mode funcsim
//               /home/kkrizka/Firmware/amacv2_tester/amacv2_testbench_microzed/amacv2_testbench_microzed.srcs/sources_1/bd/TopLevel/ip/TopLevel_amacv2_dummy_testbench_0_0/TopLevel_amacv2_dummy_testbench_0_0_sim_netlist.v
// Design      : TopLevel_amacv2_dummy_testbench_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "TopLevel_amacv2_dummy_testbench_0_0,amacv2_dummy_testbench_v1_0,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "amacv2_dummy_testbench_v1_0,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module TopLevel_amacv2_dummy_testbench_0_0
   (RO_PG_O,
    OFout,
    GPO,
    RESETB,
    DCDCen,
    ID,
    LDx0en,
    LDx1en,
    LDx2en,
    LDy0en,
    LDy1en,
    LDy2en,
    SSSHx,
    SSSHy,
    HrstBx,
    HrstBy,
    OFin,
    DCDCadj,
    GPI,
    LAM,
    PGOOD,
    FPGA_CMD_IN_P,
    FPGA_CMD_IN_N,
    FPGA_CMD_OUT_P,
    FPGA_CMD_OUT_N,
    FPGA_HVOSC0,
    FPGA_HVOSC1,
    FPGA_HVOSC2,
    FPGA_HVOSC3,
    FPGA_CLKOUT,
    SCLK,
    SDI,
    SDO,
    DPOT_CS0,
    DPOT_CS1,
    DPOT_CS2,
    DAC_CS0,
    DAC_CS1,
    ADC_CS0,
    ADC_CS1,
    ADC_CS2,
    FPGA_ADC_CNV,
    LD_EN_DVDD,
    LD_EN_DCDC,
    LD_EN_HV,
    LD_EN_HI,
    LD_EN_5,
    LD_EN_3V3,
    LD_EN_2V5,
    LD_EN_1V8,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axi_aclk,
    s00_axi_aresetn);
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
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN TopLevel_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *) input [3:0]s00_axi_awaddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input s00_axi_rready;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN TopLevel_processing_system7_0_0_FCLK_CLK0" *) input s00_axi_aclk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* x_interface_parameter = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW" *) input s00_axi_aresetn;

  wire \<const0> ;
  wire ADC_CS0;
  wire ADC_CS1;
  wire ADC_CS2;
  wire DAC_CS0;
  wire DAC_CS1;
  wire DCDCadj;
  wire DCDCen;
  wire DPOT_CS0;
  wire DPOT_CS1;
  wire DPOT_CS2;
  wire FPGA_ADC_CNV;
  wire FPGA_CLKOUT;
  (* SLEW = "SLOW" *) wire FPGA_CMD_IN_N;
  (* SLEW = "SLOW" *) wire FPGA_CMD_IN_P;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire FPGA_CMD_OUT_N;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire FPGA_CMD_OUT_P;
  wire FPGA_HVOSC0;
  wire FPGA_HVOSC1;
  wire FPGA_HVOSC2;
  wire FPGA_HVOSC3;
  wire GPI;
  wire GPO;
  wire HrstBx;
  wire HrstBy;
  wire [4:0]ID;
  wire LAM;
  wire LD_EN_1V8;
  wire LD_EN_2V5;
  wire LD_EN_3V3;
  wire LD_EN_5;
  wire LD_EN_DCDC;
  wire LD_EN_DVDD;
  wire LD_EN_HI;
  wire LD_EN_HV;
  wire LDx0en;
  wire LDx1en;
  wire LDx2en;
  wire LDy0en;
  wire LDy1en;
  wire LDy2en;
  wire OFin;
  wire OFout;
  wire PGOOD;
  wire RESETB;
  wire RO_PG_O;
  wire SCLK;
  wire SDI;
  wire SDO;
  wire SSSHx;
  wire SSSHy;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  TopLevel_amacv2_dummy_testbench_0_0_amacv2_dummy_testbench_v1_0 U0
       (.DCDCadj(DCDCadj),
        .DCDCen(DCDCen),
        .FPGA_CLKOUT(FPGA_CLKOUT),
        .FPGA_CMD_IN_N(FPGA_CMD_IN_N),
        .FPGA_CMD_IN_P(FPGA_CMD_IN_P),
        .FPGA_CMD_OUT_N(FPGA_CMD_OUT_N),
        .FPGA_CMD_OUT_P(FPGA_CMD_OUT_P),
        .FPGA_HVOSC0(FPGA_HVOSC0),
        .FPGA_HVOSC1(FPGA_HVOSC1),
        .FPGA_HVOSC2(FPGA_HVOSC2),
        .FPGA_HVOSC3(FPGA_HVOSC3),
        .GPO(GPO),
        .HrstBx(HrstBx),
        .HrstBy(HrstBy),
        .LAM(LAM),
        .LD_EN_1V8({LD_EN_1V8,LD_EN_2V5,LD_EN_3V3,LD_EN_5,LD_EN_HI,LD_EN_HV,LD_EN_DCDC,LD_EN_DVDD,FPGA_ADC_CNV,ADC_CS2,ADC_CS1,ADC_CS0,DAC_CS1,DAC_CS0,DPOT_CS2,DPOT_CS1,DPOT_CS0,SDI,SCLK}),
        .LDx0en(LDx0en),
        .LDx1en(LDx1en),
        .LDx2en(LDx2en),
        .LDy0en(LDy0en),
        .LDy1en(LDy1en),
        .LDy2en(LDy2en),
        .OFout(OFout),
        .Q({PGOOD,GPI,OFin,SSSHy,SSSHx,RESETB,ID}),
        .RO_PG_O(RO_PG_O),
        .SDO(SDO),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arready(s00_axi_arready),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "amacv2_dummy_testbench_v1_0" *) 
module TopLevel_amacv2_dummy_testbench_0_0_amacv2_dummy_testbench_v1_0
   (s00_axi_awready,
    s00_axi_wready,
    s00_axi_arready,
    s00_axi_rvalid,
    Q,
    LD_EN_1V8,
    s00_axi_rdata,
    s00_axi_bvalid,
    FPGA_CMD_IN_P,
    FPGA_CMD_IN_N,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_arvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    FPGA_CLKOUT,
    FPGA_HVOSC3,
    FPGA_HVOSC2,
    FPGA_HVOSC1,
    FPGA_HVOSC0,
    LAM,
    DCDCadj,
    HrstBy,
    HrstBx,
    LDy2en,
    LDy1en,
    LDy0en,
    LDx2en,
    LDx1en,
    LDx0en,
    DCDCen,
    GPO,
    OFout,
    RO_PG_O,
    SDO,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready,
    FPGA_CMD_OUT_P,
    FPGA_CMD_OUT_N);
  output s00_axi_awready;
  output s00_axi_wready;
  output s00_axi_arready;
  output s00_axi_rvalid;
  output [10:0]Q;
  output [18:0]LD_EN_1V8;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  output FPGA_CMD_IN_P;
  output FPGA_CMD_IN_N;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_arvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input FPGA_CLKOUT;
  input FPGA_HVOSC3;
  input FPGA_HVOSC2;
  input FPGA_HVOSC1;
  input FPGA_HVOSC0;
  input LAM;
  input DCDCadj;
  input HrstBy;
  input HrstBx;
  input LDy2en;
  input LDy1en;
  input LDy0en;
  input LDx2en;
  input LDx1en;
  input LDx0en;
  input DCDCen;
  input GPO;
  input OFout;
  input RO_PG_O;
  input SDO;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;
  input FPGA_CMD_OUT_P;
  input FPGA_CMD_OUT_N;

  wire DCDCadj;
  wire DCDCen;
  wire FPGA_CLKOUT;
  wire FPGA_CMD_IN_N;
  wire FPGA_CMD_IN_P;
  wire FPGA_CMD_OUT_N;
  wire FPGA_CMD_OUT_P;
  wire FPGA_HVOSC0;
  wire FPGA_HVOSC1;
  wire FPGA_HVOSC2;
  wire FPGA_HVOSC3;
  wire GPO;
  wire HrstBx;
  wire HrstBy;
  wire LAM;
  wire [18:0]LD_EN_1V8;
  wire LDx0en;
  wire LDx1en;
  wire LDx2en;
  wire LDy0en;
  wire LDy1en;
  wire LDy2en;
  wire OFout;
  wire [10:0]Q;
  wire RO_PG_O;
  wire SDO;
  wire [11:11]reg0_data;
  wire [15:15]reg1_data;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    FPGA_CMD_IN_buf_inst
       (.I(reg0_data),
        .O(FPGA_CMD_IN_P),
        .OB(FPGA_CMD_IN_N));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    FPGA_CMD_OUT_buf_inst
       (.I(FPGA_CMD_OUT_P),
        .IB(FPGA_CMD_OUT_N),
        .O(reg1_data));
  TopLevel_amacv2_dummy_testbench_0_0_amacv2_dummy_testbench_v1_0_S00_AXI amacv2_dummy_testbench_v1_0_S00_AXI_inst
       (.DCDCadj(DCDCadj),
        .DCDCen(DCDCen),
        .FPGA_CLKOUT(FPGA_CLKOUT),
        .FPGA_HVOSC0(FPGA_HVOSC0),
        .FPGA_HVOSC1(FPGA_HVOSC1),
        .FPGA_HVOSC2(FPGA_HVOSC2),
        .FPGA_HVOSC3(FPGA_HVOSC3),
        .GPO(GPO),
        .HrstBx(HrstBx),
        .HrstBy(HrstBy),
        .LAM(LAM),
        .LD_EN_1V8(LD_EN_1V8),
        .LDx0en(LDx0en),
        .LDx1en(LDx1en),
        .LDx2en(LDx2en),
        .LDy0en(LDy0en),
        .LDy1en(LDy1en),
        .LDy2en(LDy2en),
        .OFout(OFout),
        .RO_PG_O(RO_PG_O),
        .SDO(SDO),
        .S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .reg0_data({reg0_data,Q}),
        .reg1_data(reg1_data),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "amacv2_dummy_testbench_v1_0_S00_AXI" *) 
module TopLevel_amacv2_dummy_testbench_0_0_amacv2_dummy_testbench_v1_0_S00_AXI
   (S_AXI_AWREADY,
    S_AXI_WREADY,
    S_AXI_ARREADY,
    s00_axi_rvalid,
    reg0_data,
    LD_EN_1V8,
    s00_axi_rdata,
    s00_axi_bvalid,
    s00_axi_awvalid,
    s00_axi_wvalid,
    s00_axi_arvalid,
    s00_axi_aclk,
    s00_axi_awaddr,
    s00_axi_wdata,
    s00_axi_araddr,
    FPGA_CLKOUT,
    FPGA_HVOSC3,
    FPGA_HVOSC2,
    FPGA_HVOSC1,
    FPGA_HVOSC0,
    reg1_data,
    LAM,
    DCDCadj,
    HrstBy,
    HrstBx,
    LDy2en,
    LDy1en,
    LDy0en,
    LDx2en,
    LDx1en,
    LDx0en,
    DCDCen,
    GPO,
    OFout,
    RO_PG_O,
    SDO,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_AWREADY;
  output S_AXI_WREADY;
  output S_AXI_ARREADY;
  output s00_axi_rvalid;
  output [11:0]reg0_data;
  output [18:0]LD_EN_1V8;
  output [31:0]s00_axi_rdata;
  output s00_axi_bvalid;
  input s00_axi_awvalid;
  input s00_axi_wvalid;
  input s00_axi_arvalid;
  input s00_axi_aclk;
  input [1:0]s00_axi_awaddr;
  input [31:0]s00_axi_wdata;
  input [1:0]s00_axi_araddr;
  input FPGA_CLKOUT;
  input FPGA_HVOSC3;
  input FPGA_HVOSC2;
  input FPGA_HVOSC1;
  input FPGA_HVOSC0;
  input [0:0]reg1_data;
  input LAM;
  input DCDCadj;
  input HrstBy;
  input HrstBx;
  input LDy2en;
  input LDy1en;
  input LDy0en;
  input LDx2en;
  input LDx1en;
  input LDx0en;
  input DCDCen;
  input GPO;
  input OFout;
  input RO_PG_O;
  input SDO;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire DCDCadj;
  wire DCDCen;
  wire FPGA_CLKOUT;
  wire FPGA_HVOSC0;
  wire FPGA_HVOSC1;
  wire FPGA_HVOSC2;
  wire FPGA_HVOSC3;
  wire GPO;
  wire HrstBx;
  wire HrstBy;
  wire LAM;
  wire [18:0]LD_EN_1V8;
  wire LDx0en;
  wire LDx1en;
  wire LDx2en;
  wire LDy0en;
  wire LDy1en;
  wire LDy2en;
  wire OFout;
  wire RO_PG_O;
  wire SDO;
  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready_i_1_n_0;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire \axi_rdata[31]_i_1_n_0 ;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready_i_1_n_0;
  wire [1:0]p_0_in;
  wire [31:5]p_1_in;
  wire [11:0]reg0_data;
  wire [0:0]reg1_data;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire [31:12]slv_reg0;
  wire \slv_reg0[5]_i_1_n_0 ;
  wire [31:19]slv_reg2;
  wire \slv_reg2[0]_i_1_n_0 ;
  wire \slv_reg2[16]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[8]_i_1_n_0 ;
  wire slv_reg_wren__2;

  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDSE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .S(\slv_reg0[5]_i_1_n_0 ));
  FDSE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .S(\slv_reg0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready_i_1_n_0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(S_AXI_ARREADY),
        .R(\slv_reg0[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(S_AXI_AWREADY),
        .I4(p_0_in[0]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFBF0080)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_awvalid),
        .I2(s00_axi_wvalid),
        .I3(S_AXI_AWREADY),
        .I4(p_0_in[1]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(p_0_in[0]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(p_0_in[1]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .O(axi_awready_i_1_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_i_1_n_0),
        .Q(S_AXI_AWREADY),
        .R(\slv_reg0[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(S_AXI_WREADY),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_awvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(\slv_reg0[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_1 
       (.I0(RO_PG_O),
        .I1(reg0_data[0]),
        .I2(SDO),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(LD_EN_1V8[0]),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[10]_i_1 
       (.I0(LDy2en),
        .I1(reg0_data[10]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[10]),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[11]_i_1 
       (.I0(HrstBx),
        .I1(reg0_data[11]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[11]),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[12]_i_1 
       (.I0(HrstBy),
        .I1(slv_reg0[12]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[12]),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[13]_i_1 
       (.I0(DCDCadj),
        .I1(slv_reg0[13]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[13]),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[14]_i_1 
       (.I0(LAM),
        .I1(slv_reg0[14]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[14]),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[15]_i_1 
       (.I0(reg1_data),
        .I1(slv_reg0[15]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[15]),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[16]_i_1 
       (.I0(FPGA_HVOSC0),
        .I1(slv_reg0[16]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[16]),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[17]_i_1 
       (.I0(FPGA_HVOSC1),
        .I1(slv_reg0[17]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[17]),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[18]_i_1 
       (.I0(FPGA_HVOSC2),
        .I1(slv_reg0[18]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[18]),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[19]_i_1 
       (.I0(FPGA_HVOSC3),
        .I1(slv_reg0[19]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg2[19]),
        .O(reg_data_out[19]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[1]_i_1 
       (.I0(OFout),
        .I1(reg0_data[1]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[1]),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[20]_i_1 
       (.I0(FPGA_CLKOUT),
        .I1(slv_reg0[20]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(slv_reg2[20]),
        .O(reg_data_out[20]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg0[21]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[21]),
        .O(reg_data_out[21]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg0[22]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[22]),
        .O(reg_data_out[22]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg0[23]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[23]),
        .O(reg_data_out[23]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg0[24]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[24]),
        .O(reg_data_out[24]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg0[25]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[25]),
        .O(reg_data_out[25]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg0[26]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[26]),
        .O(reg_data_out[26]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg0[27]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[27]),
        .O(reg_data_out[27]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg0[28]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[28]),
        .O(reg_data_out[28]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg0[29]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[29]),
        .O(reg_data_out[29]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[2]_i_1 
       (.I0(GPO),
        .I1(reg0_data[2]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[2]),
        .O(reg_data_out[2]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg0[30]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[30]),
        .O(reg_data_out[30]));
  LUT3 #(
    .INIT(8'h08)) 
    \axi_rdata[31]_i_1 
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .O(\axi_rdata[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[31]_i_2 
       (.I0(slv_reg0[31]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(slv_reg2[31]),
        .O(reg_data_out[31]));
  LUT4 #(
    .INIT(16'h0E02)) 
    \axi_rdata[3]_i_1 
       (.I0(reg0_data[3]),
        .I1(axi_araddr[3]),
        .I2(axi_araddr[2]),
        .I3(LD_EN_1V8[3]),
        .O(reg_data_out[3]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[4]_i_1 
       (.I0(DCDCen),
        .I1(reg0_data[4]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[4]),
        .O(reg_data_out[4]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[5]_i_1 
       (.I0(LDx0en),
        .I1(reg0_data[5]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[5]),
        .O(reg_data_out[5]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[6]_i_1 
       (.I0(LDx1en),
        .I1(reg0_data[6]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[6]),
        .O(reg_data_out[6]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[7]_i_1 
       (.I0(LDx2en),
        .I1(reg0_data[7]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[7]),
        .O(reg_data_out[7]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[8]_i_1 
       (.I0(LDy0en),
        .I1(reg0_data[8]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[8]),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \axi_rdata[9]_i_1 
       (.I0(LDy1en),
        .I1(reg0_data[9]),
        .I2(axi_araddr[3]),
        .I3(axi_araddr[2]),
        .I4(LD_EN_1V8[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\axi_rdata[31]_i_1_n_0 ),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(\slv_reg0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_WREADY),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(S_AXI_WREADY),
        .R(\slv_reg0[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[3]),
        .O(p_1_in[31]));
  LUT1 #(
    .INIT(2'h1)) 
    \slv_reg0[5]_i_1 
       (.I0(s00_axi_aresetn),
        .O(\slv_reg0[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[5]_i_2 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[0]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg0[5]_i_3 
       (.I0(S_AXI_WREADY),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_awvalid),
        .O(slv_reg_wren__2));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[8]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb[1]),
        .O(p_1_in[8]));
  FDRE \slv_reg0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[0]),
        .Q(reg0_data[0]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[10]),
        .Q(reg0_data[10]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[11]),
        .Q(reg0_data[11]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg0[12]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg0[13]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg0[14]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg0[15]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg0[16]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg0[17]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg0[18]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg0[19]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[1]),
        .Q(reg0_data[1]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg0[20]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg0[21]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg0[22]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg0[23]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg0[24]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg0[25]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg0[26]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg0[27]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg0[28]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg0[29]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[2]),
        .Q(reg0_data[2]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg0[30]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg0[31]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[3]),
        .Q(reg0_data[3]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[4]),
        .Q(reg0_data[4]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[5]),
        .Q(reg0_data[5]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[6]),
        .Q(reg0_data[6]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[5]),
        .D(s00_axi_wdata[7]),
        .Q(reg0_data[7]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[8]),
        .Q(reg0_data[8]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg0_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[8]),
        .D(s00_axi_wdata[9]),
        .Q(reg0_data[9]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[0]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[16]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[8]_i_1 
       (.I0(slv_reg_wren__2),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[8]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(LD_EN_1V8[0]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(LD_EN_1V8[10]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(LD_EN_1V8[11]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(LD_EN_1V8[12]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(LD_EN_1V8[13]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(LD_EN_1V8[14]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(LD_EN_1V8[15]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(LD_EN_1V8[16]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(LD_EN_1V8[17]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(LD_EN_1V8[18]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg2[19]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(LD_EN_1V8[1]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg2[20]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg2[21]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg2[22]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[16]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg2[23]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg2[24]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg2[25]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg2[26]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg2[27]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg2[28]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg2[29]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(LD_EN_1V8[2]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg2[30]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg2[31]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(LD_EN_1V8[3]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(LD_EN_1V8[4]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(LD_EN_1V8[5]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(LD_EN_1V8[6]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[0]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(LD_EN_1V8[7]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(LD_EN_1V8[8]),
        .R(\slv_reg0[5]_i_1_n_0 ));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[8]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(LD_EN_1V8[9]),
        .R(\slv_reg0[5]_i_1_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
