----------------------------------------------------------------
--                      JK-Flip Flop (TB)
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         25.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_jk_flipflop is
end tb_jk_flipflop;

architecture tb_jk_flipflop_sim of tb_jk_flipflop is

  component jk_flipflop
  port (data_i   :  in  std_logic;  -- Data Input
        clk_i    :  in  std_logic;  -- Clock
        reset_i  :  in  std_logic;  -- Reset
        toggle_i :  in  std_logic;  -- Toggle
        qout_o   :  out std_logic); -- Output
  end component;
  
  signal data_i   :  std_logic;
  signal clk_i    :  std_logic := '0';
  signal reset_i  :  std_logic := '0';
  signal toggle_i :  std_logic := '0';
  signal qout_o   :  std_logic;
  
begin
  
 -- clk_i <= not(clk_i) after 5 ns; -- 100MHz (19ms)
 -- toggle_i <= not(toggle_i) after 20 ns;
 -- reset_i <= '1' after 150 ns;
  
  i_jk_flipflop : jk_flipflop
  port map
    (data_i  => data_i,
     clk_i   => clk_i,
     reset_i => reset_i,
     toggle_i => toggle_i,
     qout_o  => qout_o);
     
 -- jk_flipflop_test : process
 -- begin
    -- OFF
 --   data_i <= '0';
 --   wait for 55 ns;
    -- ON
 --   data_i <= '1';
 --   wait until clk_i = '1';
    
 -- end process jk_flipflop_test;
  p_clk : process
begin
  clk_i <= '0';
  wait for 50 ns;
  clk_i <= '1';
  wait for 50 ns;
end process p_clk;

p_reset : process
begin
  reset_i <= '1';
  wait for 500 ns;
  reset_i <= '0';
  wait;
end process p_reset;

run : process
begin

  toggle_i <= '0';
  data_i <= '0';
  wait for 400 ns;

  toggle_i <= '0';
  data_i <= '1';
  wait for 400 ns;

  toggle_i <= '1';
  data_i <= '0';
  wait for 400 ns;

  toggle_i <= '1';
  data_i <= '1';
  wait for 400 ns;

end process run;
end tb_jk_flipflop_sim;