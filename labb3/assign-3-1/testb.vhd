library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mypackage.all;

entity testb is
  port (testok : out std_logic := 'H');
end entity;  -- testb

architecture arch of testb is
  signal reset, en, d, q : std_logic;
  signal clk             : std_logic := '0';
begin
  
  reset <= '1', '0' after 150 ns;
  clk   <= not clk  after 100 ns;
  
  u1 : fdre port map(clk, reset, en, d, q);

  test : process
  begin
    -- It should have a working {reset}
    wait for 200 ns;
    if q /= '0' then
      testok <= '0';
      report "error at time 200";
    end if;

    -- It should be possible to set {q} when {en} is active
    en <= '1';
    d  <= '1';
    wait for 200 ns;
    if q /= '1' then
      testok <= '0';
      report "error at time 400";
    end if;

    -- It should ignore {d} if {en} is deactivated, q = 0
    en <= '0';
    d  <= '0';
    wait for 200 ns;
    if q /= '1' then
      testok <= '0';
      report "error at time 600";
    end if;

    -- It should be possible to set {q} to {0} when {en} is active
    en <= '1';
    d  <= '0';
    wait for 200 ns;
    if q /= '0' then
      testok <= '0';
      report "error at time 800";
    end if;

    -- It should ignore {d} if {en} is deactivated, q = 1
    en <= '0';
    d  <= '1';
    wait for 200 ns;
    if q /= '0' then
      testok <= '0';
      report "error at time 1000";
    end if;
    
    wait;
  end process;
  
end architecture;  -- arch