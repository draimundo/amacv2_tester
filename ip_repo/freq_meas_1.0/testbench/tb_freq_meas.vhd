library ieee;
use ieee.std_logic_1164.all;

entity tb_freq_meas is
  port (
    clock : in  std_logic;
    reset : in  std_logic
  );
end entity tb_freq_meas;

architecture behav of tb_freq_meas is

    component freq_meas_comp_v1_0 is
    Port ( 
        frq_i : in std_logic; -- input signal to be measured
        clk_i  : in std_logic; --AXI clock

        --First 32bits output register - High Edge Measurment data
        hi_n_o  : out std_logic_vector (31 downto 0); --nb of detected transitions to high
        --Second 32bits output register - Low Edge Measurment data
        lo_n_o  : out std_logic_vector (31 downto 0);
        --Third 32bits output register - Duty Cycle data
        hi_t_o  : out std_logic_vector (31 downto 0); --time high
        --32bits input register - Control
        ts_cnt_i : in std_logic_vector(29 downto 0); --wanted analysis timespan
        freeze_i : in std_logic; --freeze register - measurement continues - active HI
        nrst_i  : in std_logic -- sync. reset active low
         );
    end component freq_meas_comp_v1_0;
	
	signal frq_i : std_logic;
	
	signal hi_n_o  : std_logic_vector(31 downto 0);
	signal lo_n_o  : std_logic_vector(31 downto 0);
	signal hi_t_o  : std_logic_vector(31 downto 0);
	signal ts_cnt_i : std_logic_vector(29 downto 0);
	
	signal freeze_i : std_logic;
begin
	fmcomp : freq_meas_comp_v1_0
		port map(
			frq_i 	=> '0',
			nrst_i  => reset,
			clk_i  => clock,

			hi_n_o => hi_n_o,
			lo_n_o => lo_n_o,
			hi_t_o => hi_t_o,

			ts_cnt_i => ts_cnt_i,

			freeze_i => freeze_i
		);
end behav;
			
