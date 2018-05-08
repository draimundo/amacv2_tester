library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity amacv2_dummy_testbench_v1_0 is
  generic (
    -- Users to add parameters here

    -- User parameters ends
    -- Do not modify the parameters beyond this line


    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	: integer	:= 32;
    C_S00_AXI_ADDR_WIDTH	: integer	:= 4
    );
  port (
    -- Users to add ports here

    -- Connections to the AMACv2
    RO_PG_O     : in  std_logic;
    OFout       : in  std_logic;
    GPO         : in  std_logic;
    RESETB      : out std_logic;
    DCDCen      : in  std_logic;
    ID          : out std_logic_vector(4 downto 0);
    LDx0en      : in  std_logic;
    LDx1en      : in  std_logic;
    LDx2en      : in  std_logic;
    LDy0en      : in  std_logic;
    LDy1en      : in  std_logic;
    LDy2en      : in  std_logic;
    SSSHx       : out std_logic;
    SSSHy       : out std_logic;
    HrstBx      : in  std_logic;
    HrstBy      : in  std_logic;
    OFin        : out std_logic;
    DCDCadj     : in  std_logic;
    GPI         : out std_logic;
    LAM         : in  std_logic;
    PGOOD       : out std_logic;
    CMD_IN_P    : out std_logic;
    CMD_IN_N    : out std_logic;
    CMD_OUT_P   : in  std_logic;
    CMD_OUT_N   : in  std_logic;
    HVOSC0      : in  std_logic;
    HVOSC1      : in  std_logic;
    HVOSC2      : in  std_logic;
    HVOSC3      : in  std_logic;
    CLKOUT      : in  std_logic;

    -- Testboard connections
    SCLK        : out std_logic;
    SDI         : out std_logic;
    SDO         : in  std_logic;
    DPOT_CS0    : out std_logic;
    DPOT_CS1    : out std_logic;
    DPOT_CS2    : out std_logic;
    DAC_CS0     : out std_logic;
    DAC_CS1     : out std_logic;
    ADC_CS0     : out std_logic;
    ADC_CS1     : out std_logic;
    ADC_CS2     : out std_logic;
    MPM_MUX_EN  : out std_logic;
    HVSW_MUX_EN : out std_logic;
    MPM_MUX     : out std_logic_vector(2 downto 0);
    ADC_CNV     : out std_logic;
    LV_EN_VP5   : out std_logic;
    LV_EN_VN5   : out std_logic;
    LV_EN_2V5   : out std_logic;
    LV_EN_AVEE  : out std_logic;
    LV_EN_AVDD5 : out std_logic;
    LV_EN_AVCC  : out std_logic;
    LD_EN_DVDD  : out std_logic;
    -- User ports ends
    -- Do not modify the ports beyond this line

    -- Ports of Axi Slave Bus Interface S00_AXI
    s00_axi_aclk	: in std_logic;
    s00_axi_aresetn	: in std_logic;
    s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_awprot	: in std_logic_vector(2 downto 0);
    s00_axi_awvalid	: in std_logic;
    s00_axi_awready	: out std_logic;
    s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
    s00_axi_wvalid	: in std_logic;
    s00_axi_wready	: out std_logic;
    s00_axi_bresp	: out std_logic_vector(1 downto 0);
    s00_axi_bvalid	: out std_logic;
    s00_axi_bready	: in std_logic;
    s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_arprot	: in std_logic_vector(2 downto 0);
    s00_axi_arvalid	: in std_logic;
    s00_axi_arready	: out std_logic;
    s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_rresp	: out std_logic_vector(1 downto 0);
    s00_axi_rvalid	: out std_logic;
    s00_axi_rready	: in std_logic
    );
end amacv2_dummy_testbench_v1_0;

architecture arch_imp of amacv2_dummy_testbench_v1_0 is

  -- component declaration
  component amacv2_dummy_testbench_v1_0_S00_AXI is
    generic (
      C_S_AXI_DATA_WIDTH	: integer	:= 32;
      C_S_AXI_ADDR_WIDTH	: integer	:= 4
      );
    port (
      reg0_data         : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      reg1_data         : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      reg2_data         : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      reg3_data         : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);

      S_AXI_ACLK	: in std_logic;
      S_AXI_ARESETN	: in std_logic;
      S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
      S_AXI_AWPROT	: in std_logic_vector(2 downto 0);

      S_AXI_AWVALID	: in std_logic;
      S_AXI_AWREADY	: out std_logic;
      S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
      S_AXI_WVALID	: in std_logic;
      S_AXI_WREADY	: out std_logic;
      S_AXI_BRESP	: out std_logic_vector(1 downto 0);
      S_AXI_BVALID	: out std_logic;
      S_AXI_BREADY	: in std_logic;
      S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
      S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
      S_AXI_ARVALID	: in std_logic;
      S_AXI_ARREADY	: out std_logic;
      S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      S_AXI_RRESP	: out std_logic_vector(1 downto 0);
      S_AXI_RVALID	: out std_logic;
      S_AXI_RREADY	: in std_logic
      );
  end component amacv2_dummy_testbench_v1_0_S00_AXI;

  -- signals
  signal CMD_IN  : std_logic;
  signal CMD_OUT : std_logic;
  
  signal reg0_data : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
  signal reg1_data : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
  signal reg2_data : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
  signal reg3_data : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
begin

-- Instantiation of Axi Bus Interface S00_AXI
  amacv2_dummy_testbench_v1_0_S00_AXI_inst : amacv2_dummy_testbench_v1_0_S00_AXI
    generic map (
      C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
      C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
      )
    port map (
      reg0_data         => reg0_data,
      reg1_data         => reg1_data,
      reg2_data         => reg2_data,
      reg3_data         => reg3_data,
      S_AXI_ACLK	=> s00_axi_aclk,
      S_AXI_ARESETN	=> s00_axi_aresetn,
      S_AXI_AWADDR	=> s00_axi_awaddr,
      S_AXI_AWPROT	=> s00_axi_awprot,
      S_AXI_AWVALID	=> s00_axi_awvalid,
      S_AXI_AWREADY	=> s00_axi_awready,
      S_AXI_WDATA	=> s00_axi_wdata,
      S_AXI_WSTRB	=> s00_axi_wstrb,
      S_AXI_WVALID	=> s00_axi_wvalid,
      S_AXI_WREADY	=> s00_axi_wready,
      S_AXI_BRESP	=> s00_axi_bresp,
      S_AXI_BVALID	=> s00_axi_bvalid,
      S_AXI_BREADY	=> s00_axi_bready,
      S_AXI_ARADDR	=> s00_axi_araddr,
      S_AXI_ARPROT	=> s00_axi_arprot,
      S_AXI_ARVALID	=> s00_axi_arvalid,
      S_AXI_ARREADY	=> s00_axi_arready,
      S_AXI_RDATA	=> s00_axi_rdata,
      S_AXI_RRESP	=> s00_axi_rresp,
      S_AXI_RVALID	=> s00_axi_rvalid,
      S_AXI_RREADY	=> s00_axi_rready
      );

  -- Add user logic here

  -- Differential buffers for AMAC communication
  CMD_IN_buf_inst : OBUFDS
    --generic map (
    --  IOSTANDARD=> "LVDS_25",
    --  DIFF_TERM => TRUE
    --  )
    port map (
      I         => CMD_IN,
      O         => CMD_IN_P,
      OB        => CMD_IN_N
      );

  CMD_OUT_buf_inst : IBUFDS
    --generic map (
    --  IOSTANDARD=> "LVDS_25",
    --  DIFF_TERM => TRUE
    --  )
    port map (
      O         => CMD_OUT,
      I         => CMD_OUT_P,
      IB        => CMD_OUT_N
      );
  
  
  -- Map to registers
  reg1_data( 0) <= RO_PG_O;
  reg1_data( 1) <= OFout;
  reg1_data( 2) <= GPO;
  reg1_data( 4) <= DCDCen;
  ID            <= reg0_data( 4 downto 0);
  RESETB        <= reg0_data( 5);
  reg1_data( 5) <= LDx0en;
  reg1_data( 6) <= LDx1en;
  reg1_data( 7) <= LDx2en;
  reg1_data( 8) <= LDy0en;
  reg1_data( 9) <= LDy1en;
  reg1_data(10) <= LDy2en;
  SSSHx         <= reg0_data( 6);
  SSSHy         <= reg0_data( 7);
  reg1_data(11) <= HrstBx;
  reg1_data(12) <= HrstBy;
  OFin          <= reg0_data( 8);
  reg1_data(13) <= DCDCadj;
  GPI           <= reg0_data( 9);
  reg1_data(14) <= LAM;
  PGOOD         <= reg0_data(10);
  CMD_IN        <= reg0_data(11);
  reg1_data(15) <= CMD_OUT;
  reg1_data(16) <= HVOSC0;
  reg1_data(17) <= HVOSC1;
  reg1_data(18) <= HVOSC2;
  reg1_data(19) <= HVOSC3;
  reg1_data(20) <= CLKOUT;

  -- Testboard connections
  SCLK          <= reg2_data( 0);
  SDI           <= reg2_data( 1);
  reg3_data(0)  <= SDO;
  DPOT_CS0      <= reg2_data( 2);
  DPOT_CS1      <= reg2_data( 3);
  DPOT_CS2      <= reg2_data( 4);
  DAC_CS0       <= reg2_data( 5);
  DAC_CS1       <= reg2_data( 6);
  ADC_CS0       <= reg2_data( 7);
  ADC_CS1       <= reg2_data( 8);
  ADC_CS2       <= reg2_data( 9);
  MPM_MUX_EN    <= reg2_data(10);
  HVSW_MUX_EN   <= reg2_data(11);
  MPM_MUX       <= reg2_data(14 downto 12);
  ADC_CNV       <= reg2_data(15);
  LV_EN_VP5     <= reg2_data(16);
  LV_EN_VN5     <= reg2_data(17);
  LV_EN_2V5     <= reg2_data(18);
  LV_EN_AVEE    <= reg2_data(19);
  LV_EN_AVDD5   <= reg2_data(20);
  LV_EN_AVCC    <= reg2_data(21);
  LD_EN_DVDD    <= reg2_data(22);

-- User logic ends

end arch_imp;
