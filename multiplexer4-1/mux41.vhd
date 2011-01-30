library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux41 is
  port (
    a : in  std_logic_vector(3 downto 0);
    s : in  std_logic_vector(1 downto 0);
    f : out std_logic
    ) ;
end entity;  -- decoder

architecture arch of mux41 is
begin
  f <= (a(0) and not s(0) and not s(1)) or (a(1) and s(0) and not s(1)) or (a(2) and s(1) and not s(0)) or (a(3) and s(1) and s(0));
end architecture;  -- arch