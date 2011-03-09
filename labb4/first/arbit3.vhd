library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;

entity arbit3 is
  port (
    r : in std_logic_vector(2 downto 0) ;
    g : out std_logic_vector(2 downto 0) ;
    reset : in std_logic
  ) ;
end entity ; -- arbit3

architecture arch of arbit3 is
  type state is (s0, s1, s2, s3);
  signal g_inner : state;
begin
  runner : process(r, reset)
  begin
    if(reset = '1' and reset'event) then
      g_inner <= (others => '0');
    elsif(r'event) then
      case(g_inner) is
        when "000" =>
          if r(2)='1' then
            g_inner <= "100";
          elsif r(1)='1' then
            g_inner <= "010";
          elsif r(0)='1' then
            g_inner <= "001";
          end if ;
        when "001" =>
          if r(0)='1' then
            -- empty
          elsif r="000" then
            g_inner <= "000";
          elsif r="010" then
            g_inner <= "010";
          elsif r="100" or r="110" then
            g_inner <= "100";
          end if;
        when "010" =>
          if r(1)='1' then
            -- empty
          elsif r="001" then
            g_inner <= "001";
          elsif r="100" or r="101" then
            g_inner <= "100";
          elsif r="000" then
            g_inner <= "000";
          end if;
        when "100" =>
          if r(2)='1' then
            -- empty
          elsif r="000" then
            g_inner <= "000";
          elsif r="001" then
            g_inner <= "001";
          elsif r="011" or r="010" then
            g_inner <= "010";
          end if ;
      end case ;
    end if;
  end process;
end architecture ; -- arch