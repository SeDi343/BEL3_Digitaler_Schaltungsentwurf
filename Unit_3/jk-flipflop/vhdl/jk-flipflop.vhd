----------------------------------------------------------------
--                       JK-Flip Flop
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         25.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity jk_flipflop is
  port (data_i   :  in  std_logic;  -- Data Input
        clk_i    :  in  std_logic;  -- Clock
        reset_i  :  in  std_logic;  -- Reset
        toggle_i :  in  std_logic;  -- Toggle
        qout_o   :  out std_logic); -- Output
end jk_flipflop;

architecture jk_flipflop_rtl of jk_flipflop is
  signal s_data_int : std_logic;
begin

  p_jk_flipflop : process(clk_i, reset_i)
  begin
    
    if (reset_i = '1') then
      s_data_int <= '0';
    elsif (clk_i'event and clk_i = '1') then
      if (toggle_i = '0' and data_i = '0') then
        s_data_int <= s_data_int;
      elsif (toggle_i = '0' and data_i = '1') then
        s_data_int <= '0';
      elsif (toggle_i = '1' and data_i = '0') then
        s_data_int <= '1';
      else
        s_data_int <= not(s_data_int);
      end if;
    end if;
    
  end process p_jk_flipflop;
  qout_o <= s_data_int;
  
end jk_flipflop_rtl;