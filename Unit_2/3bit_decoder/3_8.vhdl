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
      data_o(0) <= not data_i(2) and not data_i(1) and not data_i(0);
      data_o(1) <= not data_i(2) and not data_i(1) and     data_i(0);
      data_o(2) <= not data_i(2) and     data_i(1) and not data_i(0);
      data_o(3) <= not data_i(2) and     data_i(1) and     data_i(0);
      data_o(4) <=     data_i(2) and not data_i(1) and not data_i(0);
      data_o(5) <=     data_i(2) and not data_i(1) and     data_i(0);
      data_o(6) <=     data_i(2) and     data_i(1) and not data_i(0);
      data_o(7) <=     data_i(2) and     data_i(1) and     data_i(0);
  end process;

end bitdecoder_rtl;

  p_select : process(data_i)
  begin
    case data_i is
      when "000"  => data_o <= "00000001";
      when "001"  => data_o <= "00000010";
      when "010"  => data_o <= "00000100";
      when "011"  => data_o <= "00001000";
      when "100"  => data_o <= "00010000";
      when "101"  => data_o <= "00100000";
      when "110"  => data_o <= "01000000";
      when "111"  => data_o <= "10000000";
      when others => data_o <= "00000000";
    end case;
  end process;
  
  p_select : process(data_i)
  begin
    if      data_i = "000" then data_o <= "00000001";
      elsif data_i = "001" then data_o <= "00000010";
      elsif data_i = "010" then data_o <= "00000100";
      elsif data_i = "011" then data_o <= "00001000";
      elsif data_i = "100" then data_o <= "00010000";
      elsif data_i = "101" then data_o <= "00100000";
      elsif data_i = "110" then data_o <= "01000000";
      elsif data_i = "111" then data_o <= "10000000";
      else                      data_o <= "00000000";
    end if;
  end process; 