library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity comp1 is
  port (
  a,b: IN std_logic;
  altb, aeqb, agtb: OUT std_logic
  ) ;
end entity ; -- comp1

architecture arch of comp1 is

begin
  altb <= (not a) and b;
  aeqb <= ((not a) and (not b)) or (a and b);
  agtb <= a and (not b);
end architecture ; -- arch
