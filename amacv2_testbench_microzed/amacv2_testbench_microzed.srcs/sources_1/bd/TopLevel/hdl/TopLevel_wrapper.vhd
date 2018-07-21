--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
--Date        : Fri Jul 20 18:28:18 2018
--Host        : carl-pc running 64-bit CentOS Linux release 7.5.1804 (Core)
--Command     : generate_target TopLevel_wrapper.bd
--Design      : TopLevel_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity TopLevel_wrapper is
  port (
    ADC_CNV : out STD_LOGIC;
    CLKOUT : in STD_LOGIC;
    CMD_IN_N : out STD_LOGIC;
    CMD_IN_P : out STD_LOGIC;
    CMD_OUT_N : in STD_LOGIC;
    CMD_OUT_P : in STD_LOGIC;
    DCDCadj : in STD_LOGIC;
    DCDCen : in STD_LOGIC;
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_cas_n : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FPGA_EFUSE_PULSE : out STD_LOGIC;
    GPI : out STD_LOGIC;
    GPO : in STD_LOGIC;
    HVOSC0 : in STD_LOGIC;
    HVOSC1 : in STD_LOGIC;
    HVOSC2 : in STD_LOGIC;
    HVOSC3 : in STD_LOGIC;
    HVSW_MUX_EN : out STD_LOGIC;
    HVref_HGND_SW : out STD_LOGIC;
    HVret_SW : out STD_LOGIC;
    HrstBx : in STD_LOGIC;
    HrstBy : in STD_LOGIC;
    ID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    LAM : in STD_LOGIC;
    LD_EN_VDCDC : out STD_LOGIC;
    LD_EN_VDDRL : out STD_LOGIC;
    LDx0en : in STD_LOGIC;
    LDx1en : in STD_LOGIC;
    LDx2en : in STD_LOGIC;
    LDy0en : in STD_LOGIC;
    LDy1en : in STD_LOGIC;
    LDy2en : in STD_LOGIC;
    LED0 : out STD_LOGIC;
    LED1 : out STD_LOGIC;
    LED2 : out STD_LOGIC;
    LED3 : out STD_LOGIC;
    LVL_TRANS_EN : out STD_LOGIC;
    LV_EN_2V5 : out STD_LOGIC;
    LV_EN_AVCC : out STD_LOGIC;
    LV_EN_AVDD5 : out STD_LOGIC;
    LV_EN_AVEE : out STD_LOGIC;
    LV_EN_VN5 : out STD_LOGIC;
    LV_EN_VP5 : out STD_LOGIC;
    MPM_MUX : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MPM_MUX_EN : out STD_LOGIC;
    OFin : out STD_LOGIC;
    OFout : in STD_LOGIC;
    PGOOD : out STD_LOGIC;
    RESETB : out STD_LOGIC;
    RO_PG_O : in STD_LOGIC;
    SSSHx : out STD_LOGIC;
    SSSHy : out STD_LOGIC;
    spi_rtl_io0_io : inout STD_LOGIC;
    spi_rtl_io1_io : inout STD_LOGIC;
    spi_rtl_sck_io : inout STD_LOGIC;
    spi_rtl_ss_io : inout STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end TopLevel_wrapper;

architecture STRUCTURE of TopLevel_wrapper is
  component TopLevel is
  port (
    DDR_cas_n : inout STD_LOGIC;
    DDR_cke : inout STD_LOGIC;
    DDR_ck_n : inout STD_LOGIC;
    DDR_ck_p : inout STD_LOGIC;
    DDR_cs_n : inout STD_LOGIC;
    DDR_reset_n : inout STD_LOGIC;
    DDR_odt : inout STD_LOGIC;
    DDR_ras_n : inout STD_LOGIC;
    DDR_we_n : inout STD_LOGIC;
    DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    spi_rtl_io0_i : in STD_LOGIC;
    spi_rtl_io0_o : out STD_LOGIC;
    spi_rtl_io0_t : out STD_LOGIC;
    spi_rtl_io1_i : in STD_LOGIC;
    spi_rtl_io1_o : out STD_LOGIC;
    spi_rtl_io1_t : out STD_LOGIC;
    spi_rtl_sck_i : in STD_LOGIC;
    spi_rtl_sck_o : out STD_LOGIC;
    spi_rtl_sck_t : out STD_LOGIC;
    spi_rtl_ss_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    spi_rtl_ss_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    spi_rtl_ss_t : out STD_LOGIC;
    LED2 : out STD_LOGIC;
    LED3 : out STD_LOGIC;
    LED1 : out STD_LOGIC;
    LED0 : out STD_LOGIC;
    HVOSC2 : in STD_LOGIC;
    HVOSC1 : in STD_LOGIC;
    HVOSC0 : in STD_LOGIC;
    CLKOUT : in STD_LOGIC;
    HVOSC3 : in STD_LOGIC;
    CMD_OUT_P : in STD_LOGIC;
    CMD_OUT_N : in STD_LOGIC;
    CMD_IN_P : out STD_LOGIC;
    CMD_IN_N : out STD_LOGIC;
    OFin : out STD_LOGIC;
    ADC_CNV : out STD_LOGIC;
    MPM_MUX_EN : out STD_LOGIC;
    MPM_MUX : out STD_LOGIC_VECTOR ( 2 downto 0 );
    HVSW_MUX_EN : out STD_LOGIC;
    LV_EN_AVCC : out STD_LOGIC;
    LV_EN_AVEE : out STD_LOGIC;
    LV_EN_AVDD5 : out STD_LOGIC;
    LV_EN_VN5 : out STD_LOGIC;
    LV_EN_VP5 : out STD_LOGIC;
    LV_EN_2V5 : out STD_LOGIC;
    ID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPI : out STD_LOGIC;
    SSSHy : out STD_LOGIC;
    HrstBy : in STD_LOGIC;
    HrstBx : in STD_LOGIC;
    LDy2en : in STD_LOGIC;
    LDy1en : in STD_LOGIC;
    LDx1en : in STD_LOGIC;
    LDy0en : in STD_LOGIC;
    PGOOD : out STD_LOGIC;
    LDx0en : in STD_LOGIC;
    LDx2en : in STD_LOGIC;
    SSSHx : out STD_LOGIC;
    RESETB : out STD_LOGIC;
    RO_PG_O : in STD_LOGIC;
    OFout : in STD_LOGIC;
    DCDCen : in STD_LOGIC;
    DCDCadj : in STD_LOGIC;
    GPO : in STD_LOGIC;
    LAM : in STD_LOGIC;
    LD_EN_VDDRL : out STD_LOGIC;
    LD_EN_VDCDC : out STD_LOGIC;
    LVL_TRANS_EN : out STD_LOGIC;
    FPGA_EFUSE_PULSE : out STD_LOGIC;
    HVref_HGND_SW : out STD_LOGIC;
    HVret_SW : out STD_LOGIC
  );
  end component TopLevel;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal spi_rtl_io0_i : STD_LOGIC;
  signal spi_rtl_io0_o : STD_LOGIC;
  signal spi_rtl_io0_t : STD_LOGIC;
  signal spi_rtl_io1_i : STD_LOGIC;
  signal spi_rtl_io1_o : STD_LOGIC;
  signal spi_rtl_io1_t : STD_LOGIC;
  signal spi_rtl_sck_i : STD_LOGIC;
  signal spi_rtl_sck_o : STD_LOGIC;
  signal spi_rtl_sck_t : STD_LOGIC;
  signal spi_rtl_ss_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_rtl_ss_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal spi_rtl_ss_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal spi_rtl_ss_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal spi_rtl_ss_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal spi_rtl_ss_i_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal spi_rtl_ss_i_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal spi_rtl_ss_i_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal spi_rtl_ss_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_rtl_ss_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal spi_rtl_ss_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal spi_rtl_ss_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal spi_rtl_ss_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal spi_rtl_ss_io_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal spi_rtl_ss_io_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal spi_rtl_ss_io_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal spi_rtl_ss_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal spi_rtl_ss_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal spi_rtl_ss_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal spi_rtl_ss_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal spi_rtl_ss_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal spi_rtl_ss_o_5 : STD_LOGIC_VECTOR ( 5 to 5 );
  signal spi_rtl_ss_o_6 : STD_LOGIC_VECTOR ( 6 to 6 );
  signal spi_rtl_ss_o_7 : STD_LOGIC_VECTOR ( 7 to 7 );
  signal spi_rtl_ss_t : STD_LOGIC;
begin
TopLevel_i: component TopLevel
     port map (
      ADC_CNV => ADC_CNV,
      CLKOUT => CLKOUT,
      CMD_IN_N => CMD_IN_N,
      CMD_IN_P => CMD_IN_P,
      CMD_OUT_N => CMD_OUT_N,
      CMD_OUT_P => CMD_OUT_P,
      DCDCadj => DCDCadj,
      DCDCen => DCDCen,
      DDR_addr(14 downto 0) => DDR_addr(14 downto 0),
      DDR_ba(2 downto 0) => DDR_ba(2 downto 0),
      DDR_cas_n => DDR_cas_n,
      DDR_ck_n => DDR_ck_n,
      DDR_ck_p => DDR_ck_p,
      DDR_cke => DDR_cke,
      DDR_cs_n => DDR_cs_n,
      DDR_dm(3 downto 0) => DDR_dm(3 downto 0),
      DDR_dq(31 downto 0) => DDR_dq(31 downto 0),
      DDR_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
      DDR_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
      DDR_odt => DDR_odt,
      DDR_ras_n => DDR_ras_n,
      DDR_reset_n => DDR_reset_n,
      DDR_we_n => DDR_we_n,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      FPGA_EFUSE_PULSE => FPGA_EFUSE_PULSE,
      GPI => GPI,
      GPO => GPO,
      HVOSC0 => HVOSC0,
      HVOSC1 => HVOSC1,
      HVOSC2 => HVOSC2,
      HVOSC3 => HVOSC3,
      HVSW_MUX_EN => HVSW_MUX_EN,
      HVref_HGND_SW => HVref_HGND_SW,
      HVret_SW => HVret_SW,
      HrstBx => HrstBx,
      HrstBy => HrstBy,
      ID(4 downto 0) => ID(4 downto 0),
      LAM => LAM,
      LD_EN_VDCDC => LD_EN_VDCDC,
      LD_EN_VDDRL => LD_EN_VDDRL,
      LDx0en => LDx0en,
      LDx1en => LDx1en,
      LDx2en => LDx2en,
      LDy0en => LDy0en,
      LDy1en => LDy1en,
      LDy2en => LDy2en,
      LED0 => LED0,
      LED1 => LED1,
      LED2 => LED2,
      LED3 => LED3,
      LVL_TRANS_EN => LVL_TRANS_EN,
      LV_EN_2V5 => LV_EN_2V5,
      LV_EN_AVCC => LV_EN_AVCC,
      LV_EN_AVDD5 => LV_EN_AVDD5,
      LV_EN_AVEE => LV_EN_AVEE,
      LV_EN_VN5 => LV_EN_VN5,
      LV_EN_VP5 => LV_EN_VP5,
      MPM_MUX(2 downto 0) => MPM_MUX(2 downto 0),
      MPM_MUX_EN => MPM_MUX_EN,
      OFin => OFin,
      OFout => OFout,
      PGOOD => PGOOD,
      RESETB => RESETB,
      RO_PG_O => RO_PG_O,
      SSSHx => SSSHx,
      SSSHy => SSSHy,
      spi_rtl_io0_i => spi_rtl_io0_i,
      spi_rtl_io0_o => spi_rtl_io0_o,
      spi_rtl_io0_t => spi_rtl_io0_t,
      spi_rtl_io1_i => spi_rtl_io1_i,
      spi_rtl_io1_o => spi_rtl_io1_o,
      spi_rtl_io1_t => spi_rtl_io1_t,
      spi_rtl_sck_i => spi_rtl_sck_i,
      spi_rtl_sck_o => spi_rtl_sck_o,
      spi_rtl_sck_t => spi_rtl_sck_t,
      spi_rtl_ss_i(7) => spi_rtl_ss_i_7(7),
      spi_rtl_ss_i(6) => spi_rtl_ss_i_6(6),
      spi_rtl_ss_i(5) => spi_rtl_ss_i_5(5),
      spi_rtl_ss_i(4) => spi_rtl_ss_i_4(4),
      spi_rtl_ss_i(3) => spi_rtl_ss_i_3(3),
      spi_rtl_ss_i(2) => spi_rtl_ss_i_2(2),
      spi_rtl_ss_i(1) => spi_rtl_ss_i_1(1),
      spi_rtl_ss_i(0) => spi_rtl_ss_i_0(0),
      spi_rtl_ss_o(7) => spi_rtl_ss_o_7(7),
      spi_rtl_ss_o(6) => spi_rtl_ss_o_6(6),
      spi_rtl_ss_o(5) => spi_rtl_ss_o_5(5),
      spi_rtl_ss_o(4) => spi_rtl_ss_o_4(4),
      spi_rtl_ss_o(3) => spi_rtl_ss_o_3(3),
      spi_rtl_ss_o(2) => spi_rtl_ss_o_2(2),
      spi_rtl_ss_o(1) => spi_rtl_ss_o_1(1),
      spi_rtl_ss_o(0) => spi_rtl_ss_o_0(0),
      spi_rtl_ss_t => spi_rtl_ss_t
    );
spi_rtl_io0_iobuf: component IOBUF
     port map (
      I => spi_rtl_io0_o,
      IO => spi_rtl_io0_io,
      O => spi_rtl_io0_i,
      T => spi_rtl_io0_t
    );
spi_rtl_io1_iobuf: component IOBUF
     port map (
      I => spi_rtl_io1_o,
      IO => spi_rtl_io1_io,
      O => spi_rtl_io1_i,
      T => spi_rtl_io1_t
    );
spi_rtl_sck_iobuf: component IOBUF
     port map (
      I => spi_rtl_sck_o,
      IO => spi_rtl_sck_io,
      O => spi_rtl_sck_i,
      T => spi_rtl_sck_t
    );
spi_rtl_ss_iobuf_0: component IOBUF
     port map (
      I => spi_rtl_ss_o_0(0),
      IO => spi_rtl_ss_io(0),
      O => spi_rtl_ss_i_0(0),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_1: component IOBUF
     port map (
      I => spi_rtl_ss_o_1(1),
      IO => spi_rtl_ss_io(1),
      O => spi_rtl_ss_i_1(1),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_2: component IOBUF
     port map (
      I => spi_rtl_ss_o_2(2),
      IO => spi_rtl_ss_io(2),
      O => spi_rtl_ss_i_2(2),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_3: component IOBUF
     port map (
      I => spi_rtl_ss_o_3(3),
      IO => spi_rtl_ss_io(3),
      O => spi_rtl_ss_i_3(3),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_4: component IOBUF
     port map (
      I => spi_rtl_ss_o_4(4),
      IO => spi_rtl_ss_io(4),
      O => spi_rtl_ss_i_4(4),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_5: component IOBUF
     port map (
      I => spi_rtl_ss_o_5(5),
      IO => spi_rtl_ss_io(5),
      O => spi_rtl_ss_i_5(5),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_6: component IOBUF
     port map (
      I => spi_rtl_ss_o_6(6),
      IO => spi_rtl_ss_io(6),
      O => spi_rtl_ss_i_6(6),
      T => spi_rtl_ss_t
    );
spi_rtl_ss_iobuf_7: component IOBUF
     port map (
      I => spi_rtl_ss_o_7(7),
      IO => spi_rtl_ss_io(7),
      O => spi_rtl_ss_i_7(7),
      T => spi_rtl_ss_t
    );
end STRUCTURE;
