library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity count4b is
  port (
    reset, clk, ce : in  std_logic;
    ce_out         : out std_logic;
    q              : out std_logic_vector(3 downto 0)
    ) ;
end entity;  -- count4b

architecture arch of count4b is
  signal count : std_logic_vector(3 downto 0); -- Init-värde
begin
  process(reset, clk, ce)
  begin
    if(reset = '1' and clk'event) then
      
      -- Reset every port
      count <= (others => '0');
      q <= (others => '0');
      
    elsif(ce = '1' and clk'event) then
      count <= ((b"000" & count(0)) + (b"000" & count(1))+ ( b"000" & count(2)) + ( b"000" & count(3)) + b"0001"); -- when en = '1' else b"0000"; 
      q <= count;
    end if;
    ce_out <= ce;
  end process;
end architecture;  -- arch
