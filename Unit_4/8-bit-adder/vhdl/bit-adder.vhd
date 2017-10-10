----------------------------------------------------------------
--                       8-Bit-Adder
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         02.10.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity adder is
  port (data0_i : in  std_logic_vector(7 downto 0);
        data1_i : in  std_logic_vector(7 downto 0);
        sum_o   : out std_logic_vector(7 downto 0);
        cy_o    : out std_logic);
end adder;

architecture adder_rtl of adder is
  signal s_sum : unsigned(8 downto 0);

begin
  s_sum <= unsigned(data0_i) + unsigned('0' & (data1_i));
  cy_o <= std_logic(s_sum(8));
  sum_o <= std_logic_vector(s_sum(7 downto 0));
end adder_rtl;