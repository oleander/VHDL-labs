library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity fd is
  port (
  clk, d: in std_logic;
  q: out std_logic
  ) ;
end entity ; -- fd

architecture arch of fd is
  
begin
  runner:process(clk, d)
  begin
    if(clk = '1' and clk'event) then
      q <= d;
    end if;
end process;
end architecture ; -- arch
