library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity intro is
  port (
    clk, levin, reset : in  std_logic;
    pulson, pulsoff   : out std_logic
    ) ;
end entity;

architecture arch of intro is
  type   states is (S0, S1, S2, S3);
  signal CS, NSE : states;
begin
  sync : process (clk, reset)
  begin
    if (reset = '1') then
      CS <= S0;
      pulsoff <= '0';
      pulson <= '0';
    elsif (clk'event) then
      CS <= NSE;
    end if;
  end process;

  runner : process(clk, levin)
  begin
    if (clk = '1') then
      case CS is
        when S0 =>
          pulsoff <= '0';
          NSE <= S1;
        when S1 =>
          if (levin = '1') then
            pulson  <= '1';
            NSE <= S2;
          end if;
        when S2 =>
          if(levin = '0') then
            pulson  <= '0';
            NSE <= S3;
          end if;
        when S3 =>
          if(levin = '0') then
            pulsoff <= '1';
            NSE <= S0;
          end if;
      end case;
    end if;
  end process;
end architecture;  -- arch