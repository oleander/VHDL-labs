library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity genhz is
  port (
    clk      : in  std_logic;
    hz1, hz2 : out std_logic
    ) ;
end entity;  -- genhz

architecture arch of genhz is
begin
  runner : process(clk)
    variable counter : std_logic_vector(20 downto 0) := (others => '0');
  begin
    if(clk = '1') then
      if(counter = 1000000) then        -- En miljon
        counter := (others => '0');
        hz2     <= '1';
        hz1     <= '1';
      elsif(counter = 500000) then      -- En halv miljon
        hz2 <= '1';
      end if;

      counter := counter + 1;
    end if;
  end process;
end architecture;  -- arch
