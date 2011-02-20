library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mypackage.all;

entity testb is
  port (fail : out std_logic);
end entity;  -- testb
architecture arch of testb is
  signal clk, reset, en, d, q : std_logic;
begin
  u1 : fdre port map(clk, reset, en, d, q);

  test : process
  begin
    clk   <= '1';
    reset <= '1';
    wait for 200 ns;

    if q /= '0' then
      fail <= '0';
      report "error at time 200";
    end if;

    wait;
  end process ;
    
end architecture;  -- arch
