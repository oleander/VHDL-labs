library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hasard1 is
  port (
    x, y : in  std_logic;
    f    : out std_logic
    ) ;
end entity;  -- hasard1

architecture arch of hasard1 is
  signal f1 : std_logic;
begin
  -- f1 <= not (x and y)  after 10 ns;
  -- f  <= not (f1 and x) after 10 ns;
  f <= (not x) and y;
end architecture;  -- arch
