library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity runner is
  port (
    clk, fc, reset : in  std_logic;
    pb, lb, lbs    : out std_logic
    ) ;
end entity;

architecture arch of runner is
  type   states is (Start, S2, S3);
  signal CS, NSE : states;
  -- Håller koll på antalet fc-värden
  signal counter : integer := 0;
begin
  sync : process (clk, reset)
  begin
    
    if(clk'event and clk = '1') then
      if (reset = '1') then
        CS <= Start;
      else
        CS <= NSE;
      end if;
    end if;
  end process;

  runner : process(clk, fc)
  begin
    if(clk = '0') then
      pb  <= '0';
      lb  <= '0';
      lbs <= '0';
    end if;

    case CS is
      when Start =>
        if(fc = '0') then
          if(counter = 3 or counter = 4) then
            -- I stället för S0
            -- Personbil
            pb      <= '1';
            counter <= 0;
            NSE     <= Start;
          elsif(counter >= 7) then
            NSE <= S2;
          end if;
        end if;
        -- Personbil
      when S2 =>
        -- Är det en lastbil med släp?
        if(fc = '1') then
          NSE <= S3;
        else
          -- Lastbil
          lb      <= '1';
          counter <= 0;
          NSE     <= Start;
        end if;
        -- Lastbil med släp
      when S3 =>
        if(fc = '0') then
          lbs     <= '1';
          counter <= 0;
          NSE     <= Start;
        end if;
    end case;

    if (fc = '1' and clk = '1') then
      counter <= counter + 1;
    end if;
    
  end process;
end architecture;  -- arch