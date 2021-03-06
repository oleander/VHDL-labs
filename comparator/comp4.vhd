library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp4 is
  port (
    a, b             : in  std_logic_vector(3 downto 0);
    agtb, aeqb, altb : out std_logic
    ) ;
end entity;  -- comp4

architecture arch of comp4 is

begin
  compare_add : process(a, b)
  begin
    if (a > b) then
      agtb <= '1';
      altb <= '0';
      aeqb <= '0';
    elsif (a = b) then
      agtb <= '0';
      altb <= '0';
      aeqb <= '1';
    else
      agtb <= '0';
      altb <= '1';
      aeqb <= '0';
    end if;
  end process;
end architecture;  -- arch
