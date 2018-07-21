library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity endeavour_fmc_controller_v1_0 is
	generic (
		-- Users to add parameters here
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here
        busy        : out std_logic;
        datavalid   : out std_logic;
        CMD_IN_P    : out std_logic;
        CMD_IN_N    : out std_logic;
        
        CMD_OUT_P   : in std_logic;
        CMD_OUT_N   : in std_logic;
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
end endeavour_fmc_controller_v1_0;

architecture arch_imp of endeavour_fmc_controller_v1_0 is

	-- component declaration
	component endeavour_fmc_controller_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5
		);
		port (      
		axi_control       : out std_logic_vector(31 downto 0);
        axi_status        : in  std_logic_vector(31 downto 0);
        axi_nbitsin       : out std_logic_vector(31 downto 0);
        axi_datain        : out std_logic_vector(63 downto 0);
        axi_nbitsout      : in  std_logic_vector(31 downto 0);
        axi_dataout       : in  std_logic_vector(63 downto 0);
--        slave_data        : in  std_logic_vector(31 downto 0);
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
    end component endeavour_fmc_controller_v1_0_S00_AXI;
    		
    component endeavour_master is
        port (
            clock     : in  std_logic;
            reset     : in  std_logic;
            nbitsin   : in  integer range 0 to 63;    
            datain    : in  std_logic_vector(63 downto 0);
            send      : in  std_logic;
            busy      : out std_logic;
            nbitsout  : out integer range 0 to 63;
            dataout   : out std_logic_vector(63 downto 0);
            datavalid : out std_logic;
            error     : out std_logic;    
            serialin  : in  std_logic;
            serialout : out std_logic
        );
    end component endeavour_master;
	
	component TopLevel_clk_wiz_0_0_clk_wiz is
	   port (
	       clk_out1 : out std_logic;
	       clk_in1 : in std_logic
	   );
	end component TopLevel_clk_wiz_0_0_clk_wiz;
  --
    -- signal declarations
    signal clock100MHz    : std_logic;
    signal clock80MHz     : std_logic;
    signal reset          : std_logic;
    signal serial0        : std_logic;
    signal serial1        : std_logic;
    signal axi_control    : std_logic_vector(31 downto 0);
    signal axi_status     : std_logic_vector(31 downto 0);
    signal axi_nbitsin    : std_logic_vector(31 downto 0);
    signal axi_datain     : std_logic_vector(63 downto 0);
    signal axi_nbitsout   : std_logic_vector(31 downto 0);
    signal axi_dataout    : std_logic_vector(63 downto 0);
  
    signal axi_nbitsout_integer : integer range 0 to 63;

--    signal slave_data     : std_logic_vector( 31 downto 0);
	
begin

-- Instantiation of Axi Bus Interface S00_AXI
endeavour_fmc_controller_v1_0_S00_AXI_inst : endeavour_fmc_controller_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	    axi_control       => axi_control,
        axi_status        => axi_status,
        axi_nbitsin       => axi_nbitsin,
        axi_datain        => axi_datain,
        axi_nbitsout      => axi_nbitsout,
        axi_dataout       => axi_dataout,
--        slave_data        => slave_data,
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
	  reset         <= axi_control(0);
	-- Differential buffers for AMAC communication
    CMD_IN_buf_inst : OBUFDS
        generic map(
            IOSTANDARD => "LVDS_25"
        )
        port map(
            I   => serial0,
            O   => CMD_IN_P,
            OB  => CMD_IN_N
        );
    
    CMD_OUT_buf_inst : IBUFDS
        generic map(
            IOSTANDARD => "LVDS_25"
        )
        port map(
            I   => CMD_OUT_P,
            IB  => CMD_OUT_N,
            O   => serial1
        );
        
    busy        <= axi_status(0);
    datavalid   <= axi_status(1);
        --
    clock100MHz       <= s00_axi_aclk;
    
    inst_TopLevel_clk_wiz_0_0_clk_wiz : TopLevel_clk_wiz_0_0_clk_wiz
    port map(
        clk_out1 => clock80MHz,
        clk_in1 => clock100MHz
    );
    
    inst_endeavour_master : endeavour_master
      port map (
        clock     => clock80MHz,
        reset     => reset,
        nbitsin   => to_integer(unsigned(axi_nbitsin)),
        datain    => axi_datain,
        send      => axi_control(1),
        busy      => axi_status(0),
        nbitsout  => axi_nbitsout_integer,
        dataout   => axi_dataout,
        datavalid => axi_status(1),
        error     => axi_status(2),
        serialin  => serial1,
        serialout => serial0
        );
    axi_nbitsout  <= std_logic_vector(to_unsigned(axi_nbitsout_integer,axi_nbitsout'length));
        
    
	-- User logic ends

end arch_imp;
