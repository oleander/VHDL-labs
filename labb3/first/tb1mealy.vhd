library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb1mealy is
  port (u     : out std_logic;
        q, qp : out std_logic_vector(1 downto 0)
        ); 
end tb1mealy;

architecture test of tb1mealy is
  component mealy
    port (clk, reset : in  std_logic;
          x          : in  std_logic_vector(1 downto 0);
          u          : out std_logic;
          q, qp      : out std_logic_vector(1 downto 0));
  end component;

  signal clk   : std_logic := '0';
  signal reset : std_logic;
  signal x     : std_logic_vector(1 downto 0);
begin
  u1 : mealy port map(clk, reset, x, u, q, qp);
  clk   <= not clk  after 50 ns;
  reset <= '1', '0' after 125 ns;

  x <=
  "00" after 0  ns, -- => 01
  "01" after 200  ns, -- => 00
  "11" after 300  ns, -- => 00
  "10" after 400  ns, -- => 00
  "00" after 500  ns, -- => 01
  "00" after 600  ns, -- => 00
  "00" after 700  ns, -- => 11
  "11" after 800  ns, -- => 00
  "00" after 900  ns, -- => 01
  "00" after 1000 ns, -- => 11
  "10" after 1100 ns, -- => 00
  "11" after 1200 ns;  -- => 00 
  
end architecture;
