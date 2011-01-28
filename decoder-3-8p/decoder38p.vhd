library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder38p is
  port (
    s   : in  std_logic_vector(2 downto 0);
    sut : out std_logic_vector(7 downto 0)
    ) ;
end entity;  -- decoder

architecture arch of decoder38p is
begin  
  testing : process(s)
  begin
    sut(7) <= s(2) and s(1) and s(0);
    sut(6) <= s(2) and s(1) and not s(0);
    sut(5) <= s(2) and not s(1) and s(0);
    sut(4) <= s(2) and not s(1) and not s(0);
    sut(3) <= not s(2) and s(1) and s(0);
    sut(2) <= not s(2) and s(1) and not s(0);
    sut(1) <= not s(2) and not s(1) and s(0);
    sut(0) <= not s(2) and not s(1) and not s(0);
  end process;  -- identifier

end architecture;  -- arch
