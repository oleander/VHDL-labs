library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package components is
  component bcd59
    port(
      clk   : in  std_logic;
      reset : in  std_logic;
      ce    : in  std_logic;
      count : out std_logic_vector(7 downto 0);
      ceo   : out std_logic
      );
  end component;
  
  component bcd23
    port(
      clk   : in  std_logic;
      reset : in  std_logic;
      ce    : in  std_logic;
      count : out std_logic_vector(7 downto 0);
      ceo   : out std_logic
      );
  end component;
  
  component genhz
  port (
    clk      : in  std_logic;
    hz1, hz2 : out std_logic
    ) ;
  end component;
end package;  -- mypackage

