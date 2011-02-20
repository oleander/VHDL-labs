library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mypackage.all;

entity testb is
  port (testok : out std_logic := 'H');
end entity;  -- testb
architecture arch of testb is
  signal clk, reset, en, d, q : std_logic;
begin
  u1 : fdre port map(clk, reset, en, d, q);

  test : process
  begin
    -- It should be possible to reset {q}
    reset <= '1';
    wait for 200 ns;
    if q /= '0' then
      testok <= '0';
      report "error at time 200";
    end if;
    
    -- It should be possible to set {q} when {en} is active
    en <= '1';
    reset <= '0';
    d <= '1';
    wait for 200 ns;
    if q /= '1' then
      testok <= '0';
      report "error at time 400";
    end if;
    
    -- It should ignore {d} if {en} is deactivated
    en <= '0';
    d <= '0';
    wait for 200 ns;
    if q /= '1' then
      testok <= '0';
      report "error at time 600";
    end if;
    
    -- It should be possible to set {q} to {0} when {en} is active
    en <= '1';
    d <= '0';
    wait for 200 ns;
    if q /= '0' then
      testok <= '0';
      report "error at time 800";
    end if;
    wait;
    
  end process;
end architecture;  -- arch
