----------------------------------------------------------------
--                         3-Bit Decoder
----------------------------------------------------------------
-- ENGINEER:     Sebastian Dichler
-- DATE:         18.09.2017
-- VERSION:      1.0
----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- ENTITY

entity bitdecoder is
  port (data_i  :  in  std_logic_vector(2 downto 0);   -- data input
        data_o  :  out std_logic_vector(7 downto 0));  -- data output
end bitdecoder;

-- ARCHITECTURE

architecture bitdecoder_rtl of bitdecoder is
begin
  
  p_select : process(data_i)
  begin
    case data_i is
      when "000" => data_o <= "00000001";
      when "001" => data_o <= "00000010";
      when "010" => data_o <= "00000100";
      when "011" => data_o <= "00001000";
      when "100" => data_o <= "00010000";
      when "101" => data_o <= "00100000";
      when "110" => data_o <= "01000000";
      -- when "111" => data_o <= "10000000";
      when others => data_o <= "10000000";
    end case;
  end process;

end bitdecoder_rtl;

-- CONFIGURATION

configuration bitdecoder_rtl_cfg of bitdecoder is
  for bitdecoder_rtl
  end for;
end bitdecoder_rtl_cfg;