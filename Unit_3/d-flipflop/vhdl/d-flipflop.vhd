----------------------------------------------------------------
--                       D-Flip Flop
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         25.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENITITY

entity d_flipflop is
  port (data_i  :  in  std_logic;  -- Data Input
        clk_i   :  in  std_logic;  -- Clock
        reset_i :  in  std_logic;  -- Reset
        qout_o  :  out std_logic); -- Output
end d_flipflop;

-- ARCHITECTURE

architecture d_flipflop_rtl of d_flipflop is
begin

  p_d_flipflop : process(clk_i, reset_i)
  begin
  
    if (reset_i = '1') then
      qout_o <= '0';
    elsif (clk_i'event and clk_i = '1') then
      qout_o <= data_i;
    end if;
    
  end process p_d_flipflop;
end d_flipflop_rtl;