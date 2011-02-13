library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mypackage.all;

entity ftr is
  port (
    clk, reset, t : in  std_logic;
    q             : out std_logic
    ) ;
end entity;

architecture arch of ftr is
  signal q_inner, i : std_logic;
begin
  i <= '1' when reset = '1' else (q_inner xor t);
  ss0 : fd port map(clk, i, q_inner);
  q <= q_inner;
end architecture;
