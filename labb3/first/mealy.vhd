library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mealy is
  port (clk, reset : in  std_logic;
        x          : in  std_logic_vector(1 downto 0);
        u          : out std_logic;
        q, qp      : out std_logic_vector(1 downto 0)
        );
end mealy;

architecture arch of mealy is
  signal qn, pqn: std_logic_vector(1 downto 0);
begin

  runner: process(clk)
    begin
    if(clk = '1') then
      if(reset = '0') then
        qn <= "00";
      else
        qn <= qpn;
      end if;
    end if;
  end process;
    
  calc: process(qn, x) then
  begin
    pqn(1) <= ((not x(0)) and (not x(1)) and qn(0)) or (qn(1) and qn(0) and x(1) and x(0));
    pqn(0) <= (not x(1)) and (not x(0));
    u      <= (not qn(1)) or (not qn(0)) or (not x(1)) or x(0);
  end process;
  
  qp <= pqn;
  p <= pqn;
  
end architecture;  -- arch
