----------------------------------------------------------------
--                       AND vectorgates (TB)
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         11.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY

entity tb_vectorgates is
end tb_vectorgates;

-- ARCHITECTURE

architecture tb_vectorgates_sim of tb_vectorgates is

  component vectorgates
  port (a_i :  in  std_logic_vector(31 downto 0);   -- operand a
	b_i :  in  std_logic_vector(31 downto 0);   -- operand b
	d_o :  out std_logic_vector(31 downto 0));  -- output
  end component;
  
  signal a_i : std_logic_vector(31 downto 0);
  signal b_i : std_logic_vector(31 downto 0);
  signal d_o : std_logic_vector(31 downto 0);

begin

  i_vectorgates : vectorgates
  port map
    (a_i  => a_i,
     b_i  => b_i,
     d_o  => d_o);
	 
  program_test : process
    begin
	-- STEP 0
	a_i <= "00000000000000000000000000000001";
	b_i <= "10000000000000000000000000000001";
	wait for 200 ns;
	
	-- STEP 1
	a_i <= "11110111101111011110111101111011";
	b_i <= "11111111111111111111111111111111";
	wait for 200 ns;
	
	-- STEP 2
	a_i <= "10101010101010101010101010101010";
	b_i <= "10101010101010101000000000000000";
	wait for 200 ns;
	
  end process;

end tb_vectorgates_sim;