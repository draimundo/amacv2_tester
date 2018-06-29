----------------------------------------------------------------------------------
-- Company: LBL
-- Engineer: Daniel Raimundo
-- 
-- Create Date: 06/08/2018 10:18:53 AM
-- Design Name: 
-- Module Name: freq_meas_comp_v1_0 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_meas_comp_v1_0 is
    Port (
		frq_i : in std_logic; -- input signal to be measured
		clk_i  : in std_logic; --AXI clock

		--First 32bits output register - Edge Measurment data
		hi_n_o  : out std_logic_vector (14 downto 0); --nb of detected transitions to high
		hi_flg_o  : out std_logic; -- overflow warning flag
		lo_n_o  : out std_logic_vector (14 downto 0);
		lo_flg_o  : out std_logic; -- overflow warning flag
		--Second 32bits output register - Duty Cycle data
		hi_t_o  : out std_logic_vector (30 downto 0); --time high
		t_flg_o : out std_logic; -- overflow warning flag
		
		--32bits input register - Control
		ts_cnt_i : in std_logic_vector(29 downto 0); --wanted analysis timespan
		freeze_i : in std_logic; --freeze register - measurement continues - active HI
		nrst_i  : in std_logic -- sync. reset active low
         );
end freq_meas_comp_v1_0;

architecture Behavioral of freq_meas_comp_v1_0 is
  
    -- Synchronous signals
    signal ts_cnt : unsigned(ts_cnt_i'high downto ts_cnt_i'low); --clock counter
	signal ts_cnt_b : unsigned(ts_cnt_i'high downto ts_cnt_i'low); -- input buffer - can't change value during measurement

    signal hi_cnt : unsigned(hi_n_o'high downto hi_n_o'low);
    signal hi_flg : std_logic;
    signal lo_cnt : unsigned(lo_n_o'high downto lo_n_o'low);
    signal lo_flg : std_logic;
    signal t_cnt  : unsigned(hi_t_o'high downto hi_t_o'low);
    signal t_flg  : std_logic;

    signal frq_old : std_logic;
    
    attribute keep : string;
    attribute keep of ts_cnt:signal is "true";
    attribute keep of hi_cnt:signal is "true";
    attribute keep of hi_n_o:signal is "true";
    attribute keep of lo_cnt:signal is "true";
    attribute keep of lo_n_o:signal is "true";
    attribute keep of t_cnt:signal is "true";
    attribute keep of hi_t_o:signal is "true";
    attribute keep of freeze_i:signal is "true";
    
begin


process(clk_i)
begin
    if(rising_edge(clk_i)) then
        frq_old <= frq_i; -- no reset needed - just one sync. register
        if (nrst_i = '0') then -- synchronous reset

            hi_n_o <= (others => '0');
            lo_n_o <= (others => '0');
            hi_flg_o <= '0';
            lo_flg_o <= '0';

            ts_cnt_b <= (others => '0'); -- to restart conversion in 2 clk edges            
            ts_cnt <= (others => '0');

            hi_cnt <= (others => '0');
			hi_flg <= '0';
			lo_cnt <= (others => '0');
			lo_flg <= '0';	
        else
			ts_cnt <= ts_cnt + 1; --increase main counter -> NB: Begins truly counting at 1
			if(frq_i /= frq_old) then
                if(frq_i = '1') then
                    if(hi_cnt < (2**(hi_cnt'length)-1)) then --no overflow
                        hi_cnt <= hi_cnt + 1;
                        hi_flg <= '0';
                    else --overflow
                        hi_flg <= '1';
                    end if;
                elsif(frq_i = '0') then
                    if(lo_cnt < (2**(lo_cnt'length)-1)) then --no overflow
                        lo_cnt <= lo_cnt + 1;
                        lo_flg <= '0';
                    else --overflow
                        lo_flg <= '1';
                    end if;
                end if;
            end if;
            
            if(frq_i = '1') then
                if(t_cnt < (2**(t_cnt'length)-1)) then --no overflow
                    t_cnt <= t_cnt + 1;
                    t_flg <= '0';
                else
                    t_flg <= '1';
                end if;
            end if;
            
			if(ts_cnt >= ts_cnt_b) then --meas time elapsed
                --Update outputs if not frozen
                if(freeze_i = '0') then
                    hi_n_o <= std_logic_vector(hi_cnt);
                    hi_flg_o <= hi_flg;
                    lo_n_o <= std_logic_vector(lo_cnt);
                    lo_flg_o <= lo_flg;
                    hi_t_o <= std_logic_vector(t_cnt);
                    t_flg_o <= t_flg;
                end if;
                --Update buffers
                ts_cnt <= (others => '0');
                ts_cnt_b <= unsigned(ts_cnt_i); -- reset counter, downcounting one 32bit latch less, but 4/5 ROMs with 32bit adress width
                
                hi_cnt <= (others => '0');
                hi_flg <= '0';
                lo_cnt <= (others => '0');
                lo_flg <= '0';
                t_cnt  <= (others => '0');
                t_flg <= '0';
            end if;
        end if;
    end if;
end process;
end Behavioral;