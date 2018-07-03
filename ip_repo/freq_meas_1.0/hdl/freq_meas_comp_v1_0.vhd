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
--	signal ts_cnt_b : unsigned(ts_cnt_i'high downto ts_cnt_i'low); -- input buffer - can't change value during measurement

    signal hi_n : unsigned(hi_n_o'high to hi_n_o'low);
    signal hi_flg : std_logic;
    signal lo_n : unsigned(lo_n_o'high to lo_n_o'low);
    signal lo_flg : std_logic;
    signal hi_t  : unsigned(hi_t_o'high to hi_t_o'low);
    signal t_flg  : std_logic;
    
    signal frq_b   : std_logic;
    signal frq_s   : std_logic;
    signal frq_old : std_logic;
begin



process(clk_i)
begin
    if(rising_edge(clk_i)) then
---- 2-Stage input buffer
        frq_b   <= frq_i;
        frq_s   <= frq_b;
---- Old value to detect rising edges
        frq_old <= frq_s; -- no reset needed - just one sync. register
---- RESET
        if (nrst_i = '0') then -- synchronous reset
            hi_n_o <= (others => '0');
            lo_n_o <= (others => '0');
            hi_flg_o <= '0';
            lo_flg_o <= '0';
         
            ts_cnt <= (others => '0');

            hi_n <= (others => '0');
			hi_flg <= '0';
			lo_n <= (others => '0');
			lo_flg <= '0';	
        else
---- EDGE COUNTERS
			if(frq_s = '1' and frq_old = '0') then -- Rising edge
                if(hi_n = (2**(hi_n'length)-1)) then --overflow
                    hi_flg <= '1';
                else --no overflow
                    hi_n <= hi_n + 1;
                    hi_flg <= '0';
                end if;
            end if;
            
            if(frq_s = '0' and frq_old = '1') then -- Falling edge
                if(lo_n = (2**(lo_n'length)-1)) then --overflow
                    lo_flg <= '1';
                else --no overflow
                    lo_n <= lo_n + 1;
                    lo_flg <= '0';                   
                end if;
            end if;
            
----DUTY CYCLE COUNTER
            if(frq_s = '1') then
                if(hi_t = (2**(hi_t'length)-1)) then --overflow
                    t_flg <= '1';
                else --no overflow
                    hi_t <= hi_t + 1;
                    t_flg <= '0';
                end if;
            end if;
            
-- MAIN COUNTER (MEASUREMENT TIME)
            ts_cnt <= ts_cnt - 1; --increase main counter
			if(ts_cnt = 0) then --meas time elapsed
                if(freeze_i = '0') then --Update outputs if not frozen
                    hi_n_o <= std_logic_vector(hi_n);
                    hi_flg_o <= hi_flg;
                    lo_n_o <= std_logic_vector(lo_n);
                    lo_flg_o <= lo_flg;
                    hi_t_o <= std_logic_vector(hi_t);
                    t_flg_o <= t_flg;
                end if;
                --Update buffers
                ts_cnt <= unsigned(ts_cnt_i); -- reset counter, downcounting one 32bit latch less, but 4/5 ROMs with 32bit adress width
                
                hi_n <= (others => '0');
                hi_flg <= '0';
                lo_n <= (others => '0');
                lo_flg <= '0';
                hi_t  <= (others => '0');
                t_flg <= '0';
            end if;
        end if;
    end if;
end process;
end Behavioral;