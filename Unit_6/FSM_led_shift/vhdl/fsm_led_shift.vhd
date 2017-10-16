-------------------------------------------------------------------------------
-- Design: FSM LED Shifting                                                  --
--                                                                           --
-- Author : Sebastian Dichler                                                --
-- Date : 15 Oktober 2017                                                    --
-- File : fsm_led_shift.vhd                                                        --
-------------------------------------------------------------------------------

library work;
library IEEE;
use IEEE.std_logic_1164.all;

entity led_shift is
  port (clk_i      : in  std_logic;
        reset_i    : in  std_logic;
        fwd_bwd_i  : in  std_logic;
        en_i       : in  std_logic;
        start_i    : in  std_logic;
        led_o      : out std_logic_vector(7 downto 0));
end led_shift;

architecture led_shift_rtl of led_shift is

  type t_state is (IDLE_S, BLINK_S, SHL_S, SHR_S);
  signal s_state : t_state;
  
  signal s_q : std_logic_vector(7 downto 0);
  
begin
  p_led_shift : process(clk_i, reset_i)
  begin
    if reset_i = '1' then
      s_q <= x"00";
      s_state <= IDLE_S;
    elsif clk_i'event and clk_i = '1' then
    
      case s_state is
        when IDLE_S =>
          s_q <= x"00";
          if start_i = '1' then
            if en_i = '1' then
              if fwd_bwd_i = '1' then
                s_q <= x"01";
                s_state <= SHL_S;
              else
                s_q <= x"80";
                s_state <= SHR_S;
              end if;
            else  -- en_i = '0'
              if fwd_bwd_i = '1' then
                s_q <= x"FF";
                s_state <= BLINK_S;
              else
                s_state <= IDLE_S;
              end if;
            end if;
          else  -- start = '0'
            s_state <= IDLE_S;
         end if;
         
         when BLINK_S =>
           s_q <= x"00";
           s_state <= IDLE_S;
        
        when SHL_S =>
          if s_q = x"00" then
            s_state <= IDLE_S;
          else
            s_state <= SHL_S;
          end if;
          
          s_q(7 downto 1) <= s_q(6 downto 0);
          s_q(0) <= '0';
          
        when SHR_S =>
          if s_q = x"00" then
            s_state <= IDLE_S;
          else
            s_state <= SHR_S;
          end if;
          
          s_q(6 downto 0) <= s_q(7 downto 1);
          s_q(7) <= '0';
          
        when others =>
          s_state <= IDLE_S;
      end case;
    end if;
  end process p_led_shift;
  
  led_o <= s_q;
  
end led_shift_rtl;