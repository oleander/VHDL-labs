library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mypackage.all;

entity fjr is
  port (
    clk, resetn, j, k : in  std_logic;
    q                 : out std_logic
    ) ;
end entity;  -- fjr

architecture arch of fjr is
  signal i, q_inner : std_logic;
begin
  i <= '0' when resetn = '1'        else
        i  when j = '0' and k = '0' else
       '0' when j = '0' and k = '1' else
       '1' when j = '1' and k = '0' else
       '0' when i = '1'             else
       '1';
  ss0 : fd port map(clk, i, q_inner);
  q <= q_inner;
end architecture;
