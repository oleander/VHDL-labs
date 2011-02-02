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
    if (reset = '1' and clk'event and clk = '1') then
      CS <= S0;
    elsif (clk'event and clk = '1') then
      CS <= NSE;
    end if;
  end process;

  runner : process(CS, levin)
  begin
    
    pulson  <= '0';
    pulsoff <= '0';
    
    case CS is
      when S0 =>
        if (levin = '1') then
          NSE <= S1;
        end if;
      when S1 =>
        pulson  <= '1';
        NSE <= S2;
      when S2 =>
        if(levin = '0') then
          NSE <= S3;
        end if;
      when S3 =>
        pulsoff <= '1';
        NSE <= S0;
    end case;
  end process;
end architecture;  -- arch
