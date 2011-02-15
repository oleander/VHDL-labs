library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity drill is
  port (
    clk, reset : in std_logic
    ) ;
end entity;  -- drill

architecture arch of drill is
  type   STATE_TYPE is (s0, s1, s2, s3, s4, s5, s6);
  signal CS, ns : STATE_TYPE;
  signal drill  : std_logic_vector(43 downto 0);
  
begin
  ret : process(clk, reset)
  begin
    if(clk'event and clk = '1') then
      if(reset = '1') then
        CS <= s0;
      else
        CS <= ns;
      end if;
    end if;
  end process;

  runner : process(CS, clk)
  begin
    -- s0 => Reset-läge
    -- s1 => Vi togglar start-motorn
    -- s2 => Borren startas och sänks
    -- s3 => Väntar på att borret ska åka ner
    -- s4 => Borret är nere
    -- s5 => Väntar på att borret ska åka upp, stegar sedan ett steg
    -- s6 => Stannar stegaren och motorn, vad nu?
    
    case CS is
      when s0 =>
        drill(43) <= '1';
        ns        <= s1;
      when s1 =>
        drill(43) <= '0';
        ns        <= s2;
      when s2 =>
        drill(11) <= '1';
        drill(32) <= '1';
        ns        <= s3;
      when s3 =>
        if(drill(37) = '0') then        -- Nu är borret nere
          ns <= s4;
        end if;
      when s4 =>
        ns <= s5;
      when s5 =>
        if(drill(5) = '0') then         -- Är borret uppe?
          drill(10) <= '1';             -- Stega
          ns        <= s6;
        end if;
      when s6 =>
        drill(10) <= '0';
        drill(43) <= '0';
        -- Vad ska vi göra nu?
    end case;
  end process;
end architecture;  -- arch
