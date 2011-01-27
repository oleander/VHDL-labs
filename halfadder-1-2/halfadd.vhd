library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity halfadd is
  port(
    x   : in  std_logic;
    y   : in  std_logic;
    s   : out std_logic;
    cut : out std_logic
    );
end halfadd;

architecture comb of halfadd is
begin
  s   <= x xor y;
  cut <= x and y;
end architecture;
