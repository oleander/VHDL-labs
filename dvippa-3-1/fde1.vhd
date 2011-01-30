library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fde1 is
  port (
    clk, reset, d : in  std_logic;
    q             : out std_logic
    ) ;
end entity;  -- fde1

architecture arch of fde1 is

begin
  -- Synkron, där av {process}
  process(d, clk, reset)
  begin
    if(reset = '1') then
      q <= '0';
    elsif(clk = '1' and clk'event) then
      q <= d;
    end if;
  end process;
end architecture;  -- arch
