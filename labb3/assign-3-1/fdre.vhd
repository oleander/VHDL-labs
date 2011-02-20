library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity fdre is
  port (
  clk, reset, en, d: in std_logic;
  q: out std_logic
  ) ;
end entity;

architecture arch of fdre is
  
begin
  runner:process(clk, d, en)
  begin
    if(clk = '1' and clk'event) then
      if(reset = '1') then
        q <= '0';
      elsif(en = '1') then
        q <= d;
      end if;
    end if;
end process;
end architecture ; -- arch
