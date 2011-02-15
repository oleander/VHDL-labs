library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb2mealy is
  port (testok : out std_logic := 'H');
end tb2mealy;

architecture arch of tb2mealy is  
  signal u     : std_logic;
  signal q, qp : std_logic_vector(1 downto 0);
  
  signal clk   : std_logic := '0';
  signal reset : std_logic;
  signal x     : std_logic_vector(1 downto 0);
  
  component tb1mealy
    port (u : out std_logic;
      q, qp : out std_logic_vector(1 downto 0)
      );
  end component; 
begin
  
  u1 : tb1mealy port map(u, q, qp);

  p0 : process
  begin
    wait for 200 ns;
    
    if q /= "01" then 
      testok <= '0';
      report "error at time 200";
    end if;
    
    wait;
  end process;
end architecture;  -- arch
