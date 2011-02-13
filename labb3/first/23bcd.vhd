library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bcd59 is
  port(
    clk   : in  std_logic;
    reset : in  std_logic;
    ce    : in  std_logic;
    count : out std_logic_vector(7 downto 0);
    ceo   : out std_logic
    );
end entity;  -- 

architecture arch of bcd59 is
  -- {inner_counter_high} räknar 0 till 2
  -- {inner_counter_low} räknar 0 till 3
  
  signal inner_counter_high, inner_counter_low : std_logic_vector(3 downto 0);
begin
  runner : process(ce, clk)
  begin
    if(clk'event and clk = '1') then
      if(reset = '1') then
        
        inner_counter_low  <= (others => '0');
        inner_counter_high <= (others => '0');
        count              <= (others => '0');
        ceo                <= '0';
        
      elsif(ce = '1') then
        ceo <= '0';

        if(inner_counter_low = "0011") then  -- Nästa steg ramlar vi över kanten
          inner_counter_low <= "0000";
          if(inner_counter_high = "0010") then  -- Nästa steg ramlar vi över kanten
            inner_counter_high <= "0000";
            ceo                <= '1';
          else
            inner_counter_high <= inner_counter_high + 1;
          end if;
        else
          inner_counter_low <= inner_counter_low + 1;
        end if;
      end if;
    end if;
  end process;

  count <= inner_counter_high & inner_counter_low;
end architecture;  -- arch
