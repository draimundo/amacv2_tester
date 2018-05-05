--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
--Date        : Fri May  4 17:20:38 2018
--Host        : carl-pc running 64-bit CentOS Linux release 7.4.1708 (Core)
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
    ADC_CS0 : out STD_LOGIC;
    ADC_CS1 : out STD_LOGIC;
    ADC_CS2 : out STD_LOGIC;
    DAC_CS0 : out STD_LOGIC;
    DAC_CS1 : out STD_LOGIC;
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
    DPOT_CS0 : out STD_LOGIC;
    DPOT_CS1 : out STD_LOGIC;
    DPOT_CS2 : out STD_LOGIC;
    FIXED_IO_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_ps_clk : inout STD_LOGIC;
    FIXED_IO_ps_porb : inout STD_LOGIC;
    FIXED_IO_ps_srstb : inout STD_LOGIC;
    FPGA_ADC_CNV : out STD_LOGIC;
    FPGA_CLKOUT : in STD_LOGIC;
    FPGA_CMD_IN_N : out STD_LOGIC;
    FPGA_CMD_IN_P : out STD_LOGIC;
    FPGA_CMD_OUT_N : in STD_LOGIC;
    FPGA_CMD_OUT_P : in STD_LOGIC;
    FPGA_HVOSC0 : in STD_LOGIC;
    FPGA_HVOSC1 : in STD_LOGIC;
    FPGA_HVOSC2 : in STD_LOGIC;
    FPGA_HVOSC3 : in STD_LOGIC;
    GPI : out STD_LOGIC;
    GPO : in STD_LOGIC;
    HrstBx : in STD_LOGIC;
    HrstBy : in STD_LOGIC;
    I2C_scl_io : inout STD_LOGIC;
    I2C_sda_io : inout STD_LOGIC;
    ID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    LAM : in STD_LOGIC;
    LD_EN_1V8 : out STD_LOGIC;
    LD_EN_2V5 : out STD_LOGIC;
    LD_EN_3V3 : out STD_LOGIC;
    LD_EN_5 : out STD_LOGIC;
    LD_EN_DCDC : out STD_LOGIC;
    LD_EN_DVDD : out STD_LOGIC;
    LD_EN_HI : out STD_LOGIC;
    LD_EN_HV : out STD_LOGIC;
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
    OFin : out STD_LOGIC;
    OFout : in STD_LOGIC;
    PGOOD : out STD_LOGIC;
    RESETB : out STD_LOGIC;
    RO_PG_O : in STD_LOGIC;
    SCLK : out STD_LOGIC;
    SDI : out STD_LOGIC;
    SDO : in STD_LOGIC;
    SSSHx : out STD_LOGIC;
    SSSHy : out STD_LOGIC
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
    I2C_scl_i : in STD_LOGIC;
    I2C_scl_o : out STD_LOGIC;
    I2C_scl_t : out STD_LOGIC;
    I2C_sda_i : in STD_LOGIC;
    I2C_sda_o : out STD_LOGIC;
    I2C_sda_t : out STD_LOGIC;
    LED0 : out STD_LOGIC;
    LED1 : out STD_LOGIC;
    LED2 : out STD_LOGIC;
    LED3 : out STD_LOGIC;
    ADC_CS0 : out STD_LOGIC;
    ADC_CS1 : out STD_LOGIC;
    ADC_CS2 : out STD_LOGIC;
    DAC_CS0 : out STD_LOGIC;
    DAC_CS1 : out STD_LOGIC;
    DCDCadj : in STD_LOGIC;
    DCDCen : in STD_LOGIC;
    DPOT_CS0 : out STD_LOGIC;
    DPOT_CS1 : out STD_LOGIC;
    DPOT_CS2 : out STD_LOGIC;
    FPGA_ADC_CNV : out STD_LOGIC;
    GPI : out STD_LOGIC;
    HrstBx : in STD_LOGIC;
    HrstBy : in STD_LOGIC;
    ID : out STD_LOGIC_VECTOR ( 4 downto 0 );
    LAM : in STD_LOGIC;
    LD_EN_DCDC : out STD_LOGIC;
    LD_EN_DVDD : out STD_LOGIC;
    LD_EN_HI : out STD_LOGIC;
    LD_EN_HV : out STD_LOGIC;
    LDx0en : in STD_LOGIC;
    LDx1en : in STD_LOGIC;
    LDx2en : in STD_LOGIC;
    LDy0en : in STD_LOGIC;
    LDy1en : in STD_LOGIC;
    LDy2en : in STD_LOGIC;
    LD_EN_1V8 : out STD_LOGIC;
    LD_EN_2V5 : out STD_LOGIC;
    LD_EN_3V3 : out STD_LOGIC;
    LD_EN_5 : out STD_LOGIC;
    OFin : out STD_LOGIC;
    PGOOD : out STD_LOGIC;
    SCLK : out STD_LOGIC;
    SDI : out STD_LOGIC;
    SDO : in STD_LOGIC;
    SSSHx : out STD_LOGIC;
    SSSHy : out STD_LOGIC;
    FPGA_CMD_IN_P : out STD_LOGIC;
    FPGA_CMD_IN_N : out STD_LOGIC;
    FPGA_CMD_OUT_N : in STD_LOGIC;
    FPGA_CMD_OUT_P : in STD_LOGIC;
    RO_PG_O : in STD_LOGIC;
    OFout : in STD_LOGIC;
    GPO : in STD_LOGIC;
    RESETB : out STD_LOGIC;
    FPGA_HVOSC2 : in STD_LOGIC;
    FPGA_HVOSC1 : in STD_LOGIC;
    FPGA_HVOSC0 : in STD_LOGIC;
    FPGA_HVOSC3 : in STD_LOGIC;
    FPGA_CLKOUT : in STD_LOGIC
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
  signal I2C_scl_i : STD_LOGIC;
  signal I2C_scl_o : STD_LOGIC;
  signal I2C_scl_t : STD_LOGIC;
  signal I2C_sda_i : STD_LOGIC;
  signal I2C_sda_o : STD_LOGIC;
  signal I2C_sda_t : STD_LOGIC;
begin
I2C_scl_iobuf: component IOBUF
     port map (
      I => I2C_scl_o,
      IO => I2C_scl_io,
      O => I2C_scl_i,
      T => I2C_scl_t
    );
I2C_sda_iobuf: component IOBUF
     port map (
      I => I2C_sda_o,
      IO => I2C_sda_io,
      O => I2C_sda_i,
      T => I2C_sda_t
    );
TopLevel_i: component TopLevel
     port map (
      ADC_CS0 => ADC_CS0,
      ADC_CS1 => ADC_CS1,
      ADC_CS2 => ADC_CS2,
      DAC_CS0 => DAC_CS0,
      DAC_CS1 => DAC_CS1,
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
      DPOT_CS0 => DPOT_CS0,
      DPOT_CS1 => DPOT_CS1,
      DPOT_CS2 => DPOT_CS2,
      FIXED_IO_ddr_vrn => FIXED_IO_ddr_vrn,
      FIXED_IO_ddr_vrp => FIXED_IO_ddr_vrp,
      FIXED_IO_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
      FIXED_IO_ps_clk => FIXED_IO_ps_clk,
      FIXED_IO_ps_porb => FIXED_IO_ps_porb,
      FIXED_IO_ps_srstb => FIXED_IO_ps_srstb,
      FPGA_ADC_CNV => FPGA_ADC_CNV,
      FPGA_CLKOUT => FPGA_CLKOUT,
      FPGA_CMD_IN_N => FPGA_CMD_IN_N,
      FPGA_CMD_IN_P => FPGA_CMD_IN_P,
      FPGA_CMD_OUT_N => FPGA_CMD_OUT_N,
      FPGA_CMD_OUT_P => FPGA_CMD_OUT_P,
      FPGA_HVOSC0 => FPGA_HVOSC0,
      FPGA_HVOSC1 => FPGA_HVOSC1,
      FPGA_HVOSC2 => FPGA_HVOSC2,
      FPGA_HVOSC3 => FPGA_HVOSC3,
      GPI => GPI,
      GPO => GPO,
      HrstBx => HrstBx,
      HrstBy => HrstBy,
      I2C_scl_i => I2C_scl_i,
      I2C_scl_o => I2C_scl_o,
      I2C_scl_t => I2C_scl_t,
      I2C_sda_i => I2C_sda_i,
      I2C_sda_o => I2C_sda_o,
      I2C_sda_t => I2C_sda_t,
      ID(4 downto 0) => ID(4 downto 0),
      LAM => LAM,
      LD_EN_1V8 => LD_EN_1V8,
      LD_EN_2V5 => LD_EN_2V5,
      LD_EN_3V3 => LD_EN_3V3,
      LD_EN_5 => LD_EN_5,
      LD_EN_DCDC => LD_EN_DCDC,
      LD_EN_DVDD => LD_EN_DVDD,
      LD_EN_HI => LD_EN_HI,
      LD_EN_HV => LD_EN_HV,
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
      OFin => OFin,
      OFout => OFout,
      PGOOD => PGOOD,
      RESETB => RESETB,
      RO_PG_O => RO_PG_O,
      SCLK => SCLK,
      SDI => SDI,
      SDO => SDO,
      SSSHx => SSSHx,
      SSSHy => SSSHy
    );
end STRUCTURE;
