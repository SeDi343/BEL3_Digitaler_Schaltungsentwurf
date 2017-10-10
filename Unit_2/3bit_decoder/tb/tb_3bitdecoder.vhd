----------------------------------------------------------------
--                         3-Bit Decoder (TB)
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         18.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY

entity tb_bitdecoder is
end tb_bitdecoder;

-- ARCHITECUTRE

architecture tb_bitdecoder_sim of tb_bitdecoder is
  
  component bitdecoder
  port (data_i  :  in  std_logic_vector(2 downto 0);   -- data input
        data_o  :  out std_logic_vector(7 downto 0));  -- data output
  end component;
  
  signal data_i  : std_logic_vector(2 downto 0);
  signal data_o  : std_logic_vector(7 downto 0);
  
begin
  
  i_bitdecoder : bitdecoder
  port map
    (data_i => data_i,
     data_o => data_o);
     
  bitdecoder_test : process
  begin
    -- STEP 0
    data_i <= "000";
    wait for 200 ns;
    
    -- STEP 1
    data_i <= "001";
    wait for 200 ns;
    
    -- STEP 2
    data_i <= "010";
    wait for 200 ns;
    
    -- STEP 3
    data_i <= "011";
    wait for 200 ns;
    
    -- STEP 4
    data_i <= "100";
    wait for 200 ns;
    
    -- STEP 5
    data_i <= "101";
    wait for 200 ns;
    
    -- STEP 6
    data_i <= "110";
    wait for 200 ns;
    
    -- STEP 7
    data_i <= "111";
    wait for 200 ns;
    
  end process;
  
end tb_bitdecoder_sim;

--configuration tb_bitdecoder_sim_cfg of tb_bitdecoder is
--  for tb_bitdecoder_sim
--    for i_bitdecoder : bitdecoder
--      use configuration work.bitdecoder_struc_cfg;
--    end for;
--  end for;
--end tb_bitdecoder_sim_cfg;
