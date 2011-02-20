library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package mypackage is
  component fdre
    port (
    clk, reset, en, d: in std_logic;
    q: out std_logic
    ) ;
  end component;
end package;  -- mypackage
