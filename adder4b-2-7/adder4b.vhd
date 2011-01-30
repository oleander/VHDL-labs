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
  signal c_temp, c_temp1: std_logic;
  
  component fulladder
    port (
      a, b, cin : in  std_logic;
      cut, s    : out std_logic
      ) ;
  end component;
begin
  ss0: fulladder port map (a(0), b(0), cin, c_temp, s(0));
  ss1: fulladder port map (a(1), b(1), c_temp,c_temp1, s(1));
  ss2: fulladder port map (a(2), b(2), c_temp1,c_temp, s(2));
  ss3: fulladder port map (a(3), b(3), c_temp,cut, s(1));
end architecture;  -- arch