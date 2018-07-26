library ieee;
use ieee.std_logic_1164.all;

----
-- Entity: endeavour_master
-- Author: Karol Krizka <kkrizka@gmail.com>
--
-- Entity responsible for acting as a master in the Endeavour protocol. The entity is very dumb, with the
-- software responsible for most of the work. It acts only as a (de)serializer for the morse code. The Tx
-- and Rx parts are kept almost competely separate. The only interaction is
-- that the send command also clears the datavalid flag.
--
--Generic ports
-- clock - Clock used for internal logic and to time the serial line (nominal 80 MHz)
-- reset - Active high reset signal to reset internal state machines
-- serialin - The data sent from the the Endeavour slave
-- serialout - The data sent to the the Endeavour slave
--
--Transfer ports
-- nbitsin - Number of bits to transfer from the datain
-- datain - The data to transfer. The least significant nbitsin will be send, starting with bit at nbitsin-1.
-- send - Pulse to send data stored in datain.
-- busy - Indicates that the Tx FSM is sending data. Any calls to send will be ignored.
--
--Receive ports
-- nbitsout - Number of valid bits received from the slave.
-- dataout - The data recieved from the slave, stored in the nbitsout least significant bits. The bit at nbitsout-1 was recieved first.
-- datavalid - High signal indicates that dataout contains valid and complete data. Goes low after reset,when a new word is being serialized and when data was sent.
-- error - Inidicates an error condition during serialization of serialin. Currently only the length of a pulse must be in the specified number of clock cycles.
----
entity endeavour_master is
  generic (
    -- required pause between words
    TICKS_QUIESCENT : integer := 75;    

    -- minimum, middle and maximum widths of "ZERO"
    -- middle is used for Tx
    -- min and max is used for Rx
    TICKS_DIT_MIN : integer :=   6;
    TICKS_DIT_MID : integer :=  14;
    TICKS_DIT_MAX : integer :=  22;

    -- minimum, middle and maximum widths of "ONE"
    -- middle is used for Tx
    -- min and max is used for Rx
    TICKS_DAH_MIN : integer :=  29;
    TICKS_DAH_MID : integer :=  76;
    TICKS_DAH_MAX : integer := 124;

    -- minimum, middle and maximum widths of gap between bits
    -- middle is used for Tx
    -- min and max is used for Rx
    TICKS_BITGAP_MIN : integer :=  11;
    TICKS_BITGAP_MID : integer :=  43;
    TICKS_BITGAP_MAX : integer :=  75
  );
  port (
    clock       : in  std_logic;
    reset       : in  std_logic;

    -- control signals
    nbitsin     : in  integer range 0 to 63;
    datain      : in  std_logic_vector(63 downto 0);
    send        : in  std_logic;
    busy        : out std_logic;

    nbitsout    : out integer range 0 to 63;
    dataout     : out std_logic_vector(63 downto 0);
    datavalid   : out std_logic;
    error       : out std_logic;

    -- serial signals
    serialin    : in  std_logic;
    serialout   : out std_logic
    );
end entity endeavour_master;

architecture behavioural of endeavour_master is

  signal reg_serialin1  : std_logic;
  signal reg_serialin   : std_logic;

  type fsm_wr_t is (idle, senddata, sendbit, sendgap, sendendgap);
  signal fsm_wr : fsm_wr_t := idle;

  type fsm_rd_t is (idle, waitbit, readbit, waitgap);
  signal fsm_rd : fsm_rd_t := idle;

  signal reg_nbitsin    : integer range 0 to 63         := 0;  
  signal reg_datain     : std_logic_vector(63 downto 0) := (others => '0');
  signal reg_busy       : std_logic;

  signal reg_nbitsout   : integer range 0 to 63         := 0;
  signal reg_dataout    : std_logic_vector(63 downto 0) := (others => '0');
  signal reg_datavalid  : std_logic;
  signal reg_error      : std_logic;

begin
  busy          <= reg_busy;
  datavalid     <= reg_datavalid;
  error         <= reg_error;

  nbitsout      <= reg_nbitsout;
  dataout       <= reg_dataout;

  --
  -- Register serialin on clock
  --  
  process (clock)
  begin
    if rising_edge(clock) then
      if reset = '1' then
        reg_serialin1   <= '0';
        reg_serialin    <= '0';
      else
        reg_serialin1   <= serialin;
        reg_serialin    <= reg_serialin1;
      end if;
    end if;
  end process;
  
  --
  -- The FSM for writing data to AMAC
  --  
  process (clock)
    variable writebit   : std_logic;
    variable counter    : integer range 0 to 511        := 0;
  begin
    if rising_edge(clock) then
      if reset = '1' then
        fsm_wr                  <= idle;
        reg_nbitsin             <= 0;
        reg_datain              <= (others => '0');
        reg_busy                <= '0';
        counter                 := 0;
        serialout               <= '0';
      else
        case fsm_wr is
          when idle =>
            serialout           <= '0';

            if send = '1' then
              -- latch data to send
              reg_datain        <= datain;
              reg_nbitsin       <= nbitsin;
              reg_busy          <= '1';
              fsm_wr            <= senddata;
            else
              reg_busy          <= '0';
              fsm_wr            <= idle;
            end if;

          when senddata =>
            reg_busy            <= '1';
            if reg_nbitsin = 0 then
              serialout         <= '0';
              counter           := TICKS_QUIESCENT;
              fsm_wr            <= sendendgap;
            else
              writebit          := reg_datain(reg_nbitsin-1);
              reg_nbitsin       <= reg_nbitsin - 1;
              if writebit = '0' then
                counter         := TICKS_DIT_MID;
              else
                counter         := TICKS_DAH_MID;
              end if;
              fsm_wr            <= sendbit;
            end if;

          when sendbit =>
            reg_busy            <= '1';
            if counter = 0 then
              fsm_wr            <= sendgap;
              serialout         <= '0';
              counter           := TICKS_BITGAP_MID;
            else
              fsm_wr            <= sendbit;
              serialout         <= '1';
              counter           := counter-1;
            end if;

          when sendgap =>
            reg_busy            <= '1';
            serialout           <= '0';
            if counter = 0 then
              fsm_wr            <= senddata;
            else
              fsm_wr            <= sendgap;
              counter           := counter-1;
            end if;

         when sendendgap =>
            reg_busy            <= '1';
            serialout           <= '0';
            if counter = 0 then
              fsm_wr            <= idle;
            else
              fsm_wr            <= sendendgap;
              counter           := counter-1;
            end if;

          when others =>
            fsm_wr              <= idle;
        end case;
      end if;
    end if;
  end process;

  --
  -- The FSM for receiving data from AMAC
  --
  process (clock)
    variable counter    : integer range 0 to 511        := 0;
  begin
    if rising_edge(clock) then
      if reset = '1' then
        fsm_rd                  <= idle;
        reg_nbitsout            <= 0;
        reg_dataout             <= (others => '0');
        reg_datavalid           <= '0';
        reg_error               <= '0';
        counter                 := 0;
      else
        case fsm_rd is
          when idle =>
            if reg_serialin = '1' then
              counter           := 1;
              reg_nbitsout      <= 0;
              reg_dataout       <= (others => '0');
              reg_datavalid     <= '0';
              reg_error         <= '0';
              fsm_rd            <= waitbit;
            else
              reg_datavalid     <= reg_datavalid and not send;
              fsm_rd            <= idle;
            end if;

          when waitbit =>
            if reg_serialin = '1' then
              counter           := counter+1;
            else
              fsm_rd          <= readbit;
            end if;

          when readbit =>
            if    (TICKS_DIT_MIN < counter) and (counter < TICKS_DIT_MAX) then
              reg_dataout       <= reg_dataout(62 downto 0) & '0';
              reg_nbitsout      <= reg_nbitsout + 1;
              reg_error         <= '0';
            elsif (TICKS_DAH_MIN < counter) and (counter < TICKS_DAH_MAX) then
              reg_dataout       <= reg_dataout(62 downto 0) & '1';
              reg_nbitsout      <= reg_nbitsout + 1;                                          
              reg_error         <= '0';
            else
              reg_error         <= '1';
            end if;
            counter             := 0;
            fsm_rd              <= waitgap;

          when waitgap =>
            if reg_serialin = '1' then
              counter           := 1;
              fsm_rd            <= waitbit;
            else
              counter           := counter + 1;
              if counter > TICKS_QUIESCENT then
                reg_datavalid   <= '1';
                fsm_rd          <= idle;
              end if;
            end if;

          when others =>
            fsm_rd              <= idle;
        end case;
      end if;
    end if;
  end process;

end behavioural;

