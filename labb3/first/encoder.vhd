library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encoder is
  port (
    clk, reset : in  std_logic;
    x   : in  std_logic_vector(1 downto 0);
    dir : out std_logic
    ) ;
end entity;  -- encoder

architecture arch of encoder is
  type   states is (start, s0, s1, s2, s3);
  signal cs, ns      : states;
  signal nextDir : std_logic := '0';
begin
  clocked : process(clk)
  begin
    if clk = '1' and clk'event then
      if reset='1' then
        cs <= start;
      else
        cs  <= ns;
        dir <= nextDir;
      end if;
    end if;
  end process;  -- clocked

  runner : process(x)
  begin
    case(cs) is
      when start =>
        if x = "00" then
          ns <= s0;
        else
          ns <= start;
        end if;
      when s0 =>
        report "s0";
        if x = "01" then
          nextDir <= '0';
          ns      <= s1;
        elsif x = "10" then
          nextDir <= '1';
          ns      <= s2;
        end if;
      when s1 =>
        report "s1";
        if x = "00" then
          nextDir <= '1';
          ns      <= s0;
        elsif x = "11" then
          nextDir <= '0';
          ns      <= s3;
        end if;
      when s2 =>
        report "s2";
        if x = "00" then
          nextDir <= '0';
          ns      <= s0;
        elsif x = "11" then
          nextDir <= '1';
          ns      <= s3;
        end if;
      when s3 =>
        report "s3";
        if x = "01" then
          nextDir <= '1';
          ns      <= s1;
        elsif x = "10" then
          nextDir <= '0';
          ns      <= s2;
        end if;
  end case;

end process;
end architecture;  -- arch
