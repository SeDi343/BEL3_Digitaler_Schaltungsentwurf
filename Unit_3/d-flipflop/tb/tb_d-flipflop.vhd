----------------------------------------------------------------
--                      D-Flip Flop (TB)
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         25.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- ENTITY

entity tb_d_flipflop is
end tb_d_flipflop;

-- ARCHITECTURE

architecture tb_d_flipflop_sim of tb_d_flipflop is

  component d_flipflop
  port (data_i  :  in  std_logic;  -- Data Input
        clk_i   :  in  std_logic;  -- Clock
        reset_i :  in  std_logic;  -- Reset
        qout_o  :  out std_logic); -- Output
  end component;
  
  signal data_i  :  std_logic;
  signal clk_i   :  std_logic := '0';
  signal reset_i :  std_logic := '0';
  signal qout_o  :  std_logic;
  
begin
  
  clk_i <= not(clk_i) after 5 ns; -- 100MHz (19ms)
  reset_i <= '1' after 150 ns;
  
  i_d_flipflop : d_flipflop
  port map
    (data_i  => data_i,
     clk_i   => clk_i,
     reset_i => reset_i,
     qout_o  => qout_o);
     
  d_flipflop_test : process
  begin
    -- OFF
    data_i <= '0';
    wait for 55 ns;
    -- ON
    data_i <= '1';
    wait until clk_i = '1';
    
  end process d_flipflop_test;
  
end tb_d_flipflop_sim;