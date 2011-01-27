library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fulladd is
  port (
    a, b, cin : in  std_logic;
    cut, s : out std_logic
    ) ;
end entity;  -- fulladd

architecture arch of fulladd is
begin
  s   <= (a xor b) xor cin;
  cut <= (a and b) or (a and cin) or (b and cin);

end architecture;  -- arch
