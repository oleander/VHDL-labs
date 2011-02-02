library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity counter is
  port (
    clk, reset, fc : in  std_logic;
    pbc, lbc, lbsc : out std_logic_vector(7 downto 0)
    ) ;
end entity;  -- counter

architecture arch of counter is
  signal pb, lb, lbs : std_logic;

  component runner
    port (
      clk, fc, reset : in  std_logic;
      pb, lb, lbs    : out std_logic
      ) ;
  end component;
begin
  
  calculate : process(pb, lb, lbs, reset)
    variable pb_inner, lb_inner, lbs_inner : std_logic_vector(7 downto 0);
  begin
    if(reset = '1') then
      pb_inner := (others => '0');
      pbc      <= (others => '0');

      lb_inner := (others => '0');
      lbc      <= (others => '0');

      lbs_inner := (others => '0');
      lbsc      <= (others => '0');
    elsif(pb = '1') then
      pb_inner := pb_inner + 1;
      pbc      <= pb_inner;
    elsif(lb = '1') then
      lb_inner := lb_inner + 1;
      lbc      <= lb_inner;
    elsif(lbs = '1') then
      lbs_inner := lbs_inner + 1;
      lbsc      <= lbs_inner;
    end if;
  end process;

  ss0 : runner port map (clk, fc, reset, pb, lb, lbs);
end architecture;  -- arch
