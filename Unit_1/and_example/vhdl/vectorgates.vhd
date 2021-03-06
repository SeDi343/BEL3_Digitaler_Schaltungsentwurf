----------------------------------------------------------------
--                         AND vectorgates
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         11.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY

entity vectorgates is
  port (a_i :  in  std_logic_vector(31 downto 0);   -- operand a
	b_i :  in  std_logic_vector(31 downto 0);   -- operand b
	d_o :  out std_logic_vector(31 downto 0));  -- output
end vectorgates;

-- ARCHITECTURE

architecture vectorgates_rtl of vectorgates is
begin
  d_o <= a_i and b_i;
end vectorgates_rtl;

-- CONFIGURATION

configuration vectorgates_rtl_cfg of vectorgates is
  for vectorgates_rtl
  end for;
end vectorgates_rtl_cfg;