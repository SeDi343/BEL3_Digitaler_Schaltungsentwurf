----------------------------------------------------------------
--                      8-Bit-Adder (TB)
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         02.10.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 
use IEEE.std_logic_arith.all;

entity tb_adder is
end tb_adder;

architecture tb_adder_sim of tb_adder is
  
  component adder
  port (data0_i : in  std_logic_vector(7 downto 0);
        data1_i : in  std_logic_vector(7 downto 0);
        sum_o   : out std_logic_vector(7 downto 0);
        cy_o    : out std_logic);
  end component;
  
  signal data0_i : std_logic_vector(7 downto 0);
  signal data1_i : std_logic_vector(7 downto 0);
  signal sum_o   : std_logic_vector(7 downto 0);
  signal cy_o    : std_logic;

begin
  
  i_adder : adder
  port map
  (data0_i => data0_i,
   data1_i => data1_i,
   sum_o   => sum_o,
   cy_o    => cy_o);
   
   p_test : process
    begin
      data0_i <= x"FF";
      data1_i <= x"FF";
      wait for 10 ns;
      
      data0_i <= x"00";
      data1_i <= x"00";
      wait for 10 ns;  
      
      data0_i <= x"0F";
      data1_i <= x"0F";
      wait for 10 ns;
      
      data0_i <= x"F0";
      data1_i <= x"F0";
      wait for 10 ns;
      
      data0_i <= x"0A";
      data1_i <= x"0A";
      wait for 10 ns;
      
      data0_i <= x"01";
      data1_i <= x"01";
      wait for 10 ns;
      
    end process p_test;
    
end tb_adder_sim;