library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity bcd99 is
  port (
    clk, reset, ce : in  std_logic;
    count          : out std_logic_vector(7 downto 0);
    ceo            : out std_logic
    ) ;
end entity;  -- bcd99
architecture arch of bcd99 is
  signal first : std_logic_vector(3 downto 0); -- Den under delen av {count}
  signal last  : std_logic_vector(3 downto 0); -- Den övre delen av {count}
begin
  runner : process(clk, reset, ce)
  begin
    if(clk = '1' and clk'event) then
      -- Nollställer BCD-räknaren
      if(reset = '1') then
        count <= (others => '0');
        first <= (others => '0');
        last  <= (others => '0');
        ceo   <= '0';
        -- Uppräkning
      elsif(ce = '1') then
        -- Plockar ut de minst signifikanta bitarna
        if(first = b"1001") then      -- Är vi på sista?
          first <= (others => '0');  -- Nollställer first, efter som vi är i slutet
          if(last = b"1001") then       -- Är de mest sign bitarna i slutet?
            last <= (others => '0');  -- Nollställer last, efter som vi är i slutet
            ceo  <= '1';
          else
            last <= last + '1';
          end if;
        else
          ceo  <= '0';
          first <= first + '1';
        end if;
        count <= last & first;
      end if;
    end if;
  end process;
end architecture;  -- arch
