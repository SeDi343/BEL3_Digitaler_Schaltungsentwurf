-- ----------------------------------------------------------------------------
-- Design: Abgabe5 : 4bit Shift Register                                     --
--                                                                           --
-- Author : Werner Egermann                                                  --
-- Date : 25 September 2017                                                  --
-- File : shifter.vhd                                                      --
-------------------------------------------------------------------------------

library IEEE; 
use IEEE.std_logic_1164.all; 
library work; 

entity shifter is 
  port(data_i : in std_logic_vector(3 downto 0); 
	   clk_i : in std_logic;
       reset_i : in std_logic; 
	   sh_i : in std_logic; 
	   en_i : in std_logic; 
       data_o : out std_logic_vector(3 downto 0));
end shifter;  

architecture rtl of shifter is 
  --signal s_o : std_logic_vector(3 downto 0); -- maybe not needed 
  
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
  --data_o <= s_o; 
end rtl; 