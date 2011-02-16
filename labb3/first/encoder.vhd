library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity encoder is
  port (
    clk : in  std_logic;
    x   : in  std_logic_vector(1 downto 0);
    dir : out std_logic
    ) ;
end entity;  -- encoder

architecture arch of encoder is
  type   states is (start, s0, s1, s2, s3, s4, s5, s6, s7);
  signal cs      : states    := start;
  signal ns      : states    := start;
  signal nextDir : std_logic := '0';
begin
  clocked : process(clk)
  begin
    if clk = '1' and clk'event then
      cs  <= ns;
      dir <= nextDir;
    end if;
  end process;  -- clocked

  runner : process(x, cs, ns)
  begin
    case(cs) is
      when start =>
        if x = "00" then
          ns <= s0;
        end if;
        when s0 =>
          if x = "01" then
            nextDir <= '0';
            ns      <= s2;
          elsif x = "10" then
            nextDir <= '1';
            ns      <= s5;
          end if;
        when s1 =>
          if x = "01" then
            nextDir <= '0';
            ns      <= s2;
          elsif x = "10" then
            nextDir <= '1';
            ns      <= s5;
          end if;
        when s2 =>
          if x = "00" then
            nextDir <= '1';
            ns      <= s1;
          elsif x = "11" then
            nextDir <= '0';
            ns      <= s6;
          end if;
        when s3 =>
          if x = "00" then
            nextDir <= '1';
            ns      <= s1;
          elsif x = "11" then
            nextDir <= '0';
            ns      <= s6;
          end if;
        when s4 =>
          if x = "00" then
            nextDir <= '0';
            ns      <= s0;
          elsif x = "11" then
            nextDir <= '1';
            ns      <= s7;
          end if;
        when s5 =>
          if x = "00" then
            nextDir <= '0';
            ns      <= s0;
          elsif x = "11" then
            nextDir <= '1';
            ns      <= s7;
          end if;
        when s6 =>
          if x = "01" then
            nextDir <= '1';
            ns      <= s3;
          elsif x = "10" then
            nextDir <= '0';
            ns      <= s4;
          end if;
        when s7 =>
          if x = "01" then
            nextDir <= '1';
            ns      <= s3;
          elsif x = "10" then
            nextDir <= '0';
            ns      <= s4;
          end if;
  end case;

end process;
end architecture;  -- arch
