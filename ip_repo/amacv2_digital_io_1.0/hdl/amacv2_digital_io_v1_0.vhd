library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity amacv2_digital_io_v1_0 is
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
-- AMAC outputs - slv_reg0 (read only)
        LDx0en  : in std_logic;
        LDy0en  : in std_logic;
        LDx1en  : in std_logic;
        LDy1en  : in std_logic;
        LDx2en  : in std_logic;
        LDy2en  : in std_logic;
        HrstBx  : in std_logic;
        HrstBy  : in std_logic;
        LAM     : in std_logic;
        GPO     : in std_logic;
        DCDCadj : in std_logic;
        DCDCEn  : in std_logic;
        Ofout   : in std_logic;
        RO_PG_O : in std_logic;

-- AMAC inputs - slv_reg1
        SSSHx   : out std_logic;
        SSSHy   : out std_logic;
        ResetB  : out std_logic;
        PGOOD   : out std_logic;
        GPI     : out std_logic;
        Ofin    : out std_logic;
        ID      : out std_logic_vector(4 downto 0);

-- TB inputs - slv_reg2
        LD_EN_VDDRL     : out std_logic;
        LV_EN_2V5       : out std_logic;
        LV_EN_VP5       : out std_logic;
        LV_EN_VN5       : out std_logic;
        LV_EN_AVDD5     : out std_logic;
        LV_EN_AVEE      : out std_logic;
        LV_EN_AVCC      : out std_logic;
        ADC_CNV         : out std_logic;
        MUX_SEL         : out std_logic_vector(2 downto 0);
        LD_EN_VDCDC     : out std_logic;
        HVret_SW        : out std_logic;
        LVL_TRANS_EN    : out std_logic;
        MPM_MUX_EN      : out std_logic;
        HVSW_MUX_EN     : out std_logic;
        FPGA_EFUSE_PULSE: out std_logic;
        HVref_HGND_SW   : out std_logic;
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
end amacv2_digital_io_v1_0;

architecture arch_imp of amacv2_digital_io_v1_0 is

	-- component declaration
	component amacv2_digital_io_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 4
		);
		port (
-- AMAC outputs - slv_reg0 (read only)
        LDx0en  : in std_logic;
        LDy0en  : in std_logic;
        LDx1en  : in std_logic;
        LDy1en  : in std_logic;
        LDx2en  : in std_logic;
        LDy2en  : in std_logic;
        HrstBx  : in std_logic;
        HrstBy  : in std_logic;
        LAM     : in std_logic;
        GPO     : in std_logic;
        DCDCadj : in std_logic;
        DCDCEn  : in std_logic;
        Ofout   : in std_logic;
        RO_PG_O : in std_logic;
        
-- AMAC inputs - slv_reg1
        SSSHx   : out std_logic;
        SSSHy   : out std_logic;
        ResetB  : out std_logic;
        PGOOD   : out std_logic;
        GPI     : out std_logic;
        Ofin    : out std_logic;
        ID      : out std_logic_vector(4 downto 0);
        
-- TB inputs - slv_reg2
        LD_EN_VDDRL     : out std_logic;
        LV_EN_2V5       : out std_logic;
        LV_EN_VP5       : out std_logic;
        LV_EN_VN5       : out std_logic;
        LV_EN_AVDD5     : out std_logic;
        LV_EN_AVEE      : out std_logic;
        LV_EN_AVCC      : out std_logic;
        ADC_CNV         : out std_logic;
        MUX_SEL         : out std_logic_vector(2 downto 0);
        LD_EN_VDCDC     : out std_logic;
        HVret_SW        : out std_logic;
        LVL_TRANS_EN    : out std_logic;
        MPM_MUX_EN      : out std_logic;
        HVSW_MUX_EN     : out std_logic;
        FPGA_EFUSE_PULSE: out std_logic;
        HVref_HGND_SW   : out std_logic;
		
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
	end component amacv2_digital_io_v1_0_S00_AXI;

begin

-- Instantiation of Axi Bus Interface S00_AXI
amacv2_digital_io_v1_0_S00_AXI_inst : amacv2_digital_io_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
        LDx0en				=> LDx0en,
        LDy0en                => LDy0en,
        LDx1en                => LDx1en,
        LDy1en                => LDy1en,
        LDx2en                => LDx2en,
        LDy2en                => LDy2en,
        HrstBx                => HrstBx,
        HrstBy                => HrstBy,
        LAM                    => LAM,
        GPO                    => GPO,
        DCDCadj                => DCDCadj,
        DCDCEn                => DCDCEn,
        Ofout                => Ofout,
        RO_PG_O                => RO_PG_O,
        SSSHx                => SSSHx,
        SSSHy                => SSSHy,
        ResetB                => ResetB,
        PGOOD                => PGOOD,
        GPI                    => GPI,
        Ofin                => Ofin,
        ID                    => ID,
        LD_EN_VDDRL            => LD_EN_VDDRL,
        LV_EN_2V5            => LV_EN_2V5,
        LV_EN_VP5            => LV_EN_VP5,
        LV_EN_VN5            => LV_EN_VN5,
        LV_EN_AVDD5            => LV_EN_AVDD5,
        LV_EN_AVEE            => LV_EN_AVEE,
        LV_EN_AVCC            => LV_EN_AVCC,
        ADC_CNV                => ADC_CNV,
        MUX_SEL                => MUX_SEL,
        LD_EN_VDCDC            => LD_EN_VDCDC,
        HVret_SW            => HVret_SW,
        LVL_TRANS_EN        => LVL_TRANS_EN,
        MPM_MUX_EN            => MPM_MUX_EN,
        HVSW_MUX_EN            => HVSW_MUX_EN,
        FPGA_EFUSE_PULSE    => FPGA_EFUSE_PULSE,
        HVref_HGND_SW        => HVref_HGND_SW,

	
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

	-- User logic ends

end arch_imp;
