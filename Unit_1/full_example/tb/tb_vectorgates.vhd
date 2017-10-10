----------------------------------------------------------------
--                   AND AND/OR XOR vectorgates (TB)
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         17.09.2017
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
	c_i :  in  std_logic;                       -- operand c
	d_i :  in  std_logic;                       -- operand d
	d1_o :  out std_logic_vector(31 downto 0);   -- output a and b
	d2_o :  out std_logic_vector(31 downto 0);   -- output a and/or b
	e_o :  out std_logic);                      -- output c xor d
  end component;
  
  signal a_i  : std_logic_vector(31 downto 0);
  signal b_i  : std_logic_vector(31 downto 0);
  signal c_i  : std_logic;
  signal d_i  : std_logic;
  signal d1_o : std_logic_vector(31 downto 0);
  signal d2_o : std_logic_vector(31 downto 0);
  signal e_o  : std_logic;

begin

  i_vectorgates : vectorgates
  port map
    (a_i  => a_i,
     b_i  => b_i,
     c_i  => c_i,
     d_i  => d_i,
     d1_o => d1_o,
     d2_o => d2_o,
     e_o  => e_o);
	 
  program_test : process
    begin
	-- STEP 0
	a_i <= "00000000000000000000000000000001";
	b_i <= "10000000000000000000000000000001";
	c_i <= '1';
	d_i <= '1';
	wait for 200 ns;
	
	-- STEP 1
	a_i <= "11110111101111011110111101111011";
	b_i <= "11111111111111111111111111111111";
	c_i <= '1';
	d_i <= '0';
	wait for 200 ns;
	
	-- STEP 2
	a_i <= "10101010101010101010101010101010";
	b_i <= "10101010101010101000000000000000";
	c_i <= '0';
	d_i <= '0';
	wait for 200 ns;
	
	-- STEP 3
	a_i <= "11111000001111100000111110000011";
	b_i <= "11111000001111101111111111111111";
	c_i <= '0';
	d_i <= '1';
  end process;

end tb_vectorgates_sim;