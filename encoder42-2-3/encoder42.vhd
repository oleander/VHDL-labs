library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encoder42 is
  port (
    a : in std_logic_vector(3 downto 0);
    f : out std_logic_vector(1 downto 0);
    z : out std_logic
    ) ;
end entity;  -- encoder42

architecture arch of encoder42 is
begin
  f <= b"00" when a = b"0000" else
       b"01" when a = b"0001" else
       b"10" when a = b"0010" else
       b"11";
  
  with a select
  z <= '1' when b"0000",
       '0' when others;
       
end architecture;  -- arch
