-------------------------------------------------------------------------------
-- Design: 4-bit Shift Register                                              --
--                                                                           --
-- Author : Sebastian Dichler                                                --
-- Date : 15 Oktober 2017                                                    --
-- File : shifter.vhd                                                        --
-------------------------------------------------------------------------------

library work;
library IEEE;
use IEEE.std_logic_1164.all;

entity shifter is
  port (data_i   :  in std_logic_vector(3 downto 0);  -- Data Input
        clk_i    :  in std_logic;                     -- Clock
        reset_i  :  in std_logic;                     -- Reset
        sh_i     :  in std_logic;                     -- Shift
        en_i     :  in std_logic;                     -- Enable
        data_o   : out std_logic_vector(3 downto 0)); -- Data Output
end shifter;

architecture shifter_rtl of shifter is

begin
  process (clk_i, reset_i)
  begin
    if (reset_i = '1') then
      data_o <= "0000";
    elsif (clk_i'event and clk_i = '1') then
      if (en_i = '1' and sh_i = '1') then
        data_o <= data_i(2 downto 0) & '0';
      else
        data_o <= data_i;
      end if;
    end if;
  end process;
end shifter_rtl;