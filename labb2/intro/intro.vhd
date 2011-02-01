library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity intro is
  port (
    clk, levin, reset : in  std_logic;
    pulson, pulsoff   : out std_logic
    ) ;
end entity;  -- intro

architecture arch of intro is
begin
  runner : process(clk, levin)
    variable pulson_inner : std_logic;
  begin

    -- Reset
    if(reset = '1' and clk'event) then
      pulsoff      <= '0';
      pulson_inner := '0';
      pulson       <= '0';
    elsif(clk = '1' and clk'event and levin = '1' and pulson_inner = '0') then
      pulson_inner := '1';
      pulson       <= '1';
    elsif(clk = '1' and clk'event and levin = '1' and pulson_inner = '1') then
      pulson       <= '0';
      pulson_inner := '0';
    end if;
  end process;
end architecture;  -- arch
