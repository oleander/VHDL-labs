library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder4b is
  port (
    a, b : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    s    : out std_logic_vector(3 downto 0);
    cut  : out std_logic
    ) ;
end entity;  -- adder4b

architecture arch of adder4b is
  signal first, last, second, other: std_logic;

  component fulladd
    port (
      a, b, cin : in  std_logic;
      cut, s    : out std_logic
      ) ;
  end component;
begin
  ss0 : fulladd port map (a(0), b(0), cin,    first,  s(0));
  ss1 : fulladd port map (a(1), b(1), first,  second, s(1));
  ss2 : fulladd port map (a(2), b(2), second, other,  s(2));
  ss3 : fulladd port map (a(3), b(3), other,  cut,    s(3));
end architecture;  -- arch
