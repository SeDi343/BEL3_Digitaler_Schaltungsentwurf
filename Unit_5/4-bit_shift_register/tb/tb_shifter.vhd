-------------------------------------------------------------------------------
-- Design: 4-bit Shift Register                                              --
--                                                                           --
-- Author : Sebastian Dichler                                                --
-- Date : 15 Oktober 2017                                                    --
-- File : tb_shifter.vhd                                                     --
-------------------------------------------------------------------------------

library work;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_shifter is
end tb_shifter;

architecture tb_shifter_sim of tb_shifter is
  component shifter
  port (data_i   :  in std_logic_vector(3 downto 0);  -- Data Input
        clk_i    :  in std_logic;                     -- Clock
        reset_i  :  in std_logic;                     -- Reset
        sh_i     :  in std_logic;                     -- Shift
        en_i     :  in std_logic;                     -- Enable
        data_o   : out std_logic_vector(3 downto 0)); -- Data Output
  end component;
  
  signal clk_i   : std_logic := '0';
  signal reset_i : std_logic := '0';
  signal sh_i    : std_logic;
  signal en_i    : std_logic;
  signal data_i  : std_logic_vector(3 downto 0);
  signal data_o  : std_logic_vector(3 downto 0);
  
begin
  
  clk_i <= not(clk_i) after 5 ns; -- 100MHz (10ns)
  reset_i <= '1' after 100 ns;
  
  i_shifter : shifter
  port map
    (data_i  => data_i,
     clk_i   => clk_i,
     reset_i => reset_i,
     sh_i    => sh_i,
     en_i    => en_i,
     data_o  => data_o);
     
     p_test : process
       begin
         sh_i <= '0';
         en_i <= '0';
         data_i <= "0001";
         wait for 15 ns;
         
         sh_i <= '1';
         en_i <= '0';
         data_i <= "0010";
         wait for 15 ns;
         
         sh_i <= '0';
         en_i <= '1';
         data_i <= "0011";
         wait for 15 ns;
         
         sh_i <= '1';
         en_i <= '1';
         data_i <= "1111";
         wait for 15 ns;
         
         sh_i <= '1';
         en_i <= '1';
         data_i <= "0010";
         wait for 15 ns;
         
         sh_i <= '1';
         en_i <= '1';
         data_i <= "0011";
         wait for 15 ns;
         
         data_i <= "1111";
         wait for 15 ns;
         
         data_i <= "0010";
         wait until clk_i = '1';
       end process p_test;

end tb_shifter_sim;