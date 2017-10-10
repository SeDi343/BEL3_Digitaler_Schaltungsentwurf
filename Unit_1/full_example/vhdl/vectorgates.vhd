----------------------------------------------------------------
--                   AND AND/OR XOR vectorgates
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         17.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY

entity vectorgates is
  port (a_i  :  in  std_logic_vector(31 downto 0);   -- operand a
	b_i  :  in  std_logic_vector(31 downto 0);   -- operand b
	c_i  :  in  std_logic;                       -- operand c
	d_i  :  in  std_logic;                       -- operand d
	d1_o :  out std_logic_vector(31 downto 0);   -- output a and b
	d2_o :  out std_logic_vector(31 downto 0);   -- output a and/or b
	e_o  :  out std_logic);                      -- output c xor d
end vectorgates;

-- ARCHITECTURE

architecture vectorgates_rtl of vectorgates is
begin
  d1_o <= a_i and b_i;
  d2_o(31 downto 16) <= a_i(31 downto 16) and b_i(31 downto 16);
  d2_o(15 downto 0)  <= a_i(15 downto 0)  or  b_i(15 downto 0);
  e_o <= c_i xor d_i;
end vectorgates_rtl;

-- CONFIGURATION

configuration vectorgates_rtl_cfg of vectorgates is
  for vectorgates_rtl
  end for;
end vectorgates_rtl_cfg;