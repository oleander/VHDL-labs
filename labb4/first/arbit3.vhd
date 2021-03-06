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
  signal g_inner : std_logic_vector(2 downto 0) ;
begin
  runner : process(r, reset)
  begin
    if(reset = '1' and reset'event) then      
      g_inner <= (others => '0');
    elsif r'event then
      if g_inner = "000" then
        if r(2)='1' then
          g_inner <= "100";
        elsif r(1)='1' then
          g_inner <= "010";
        elsif r(0)='1' then
          g_inner <= "001";
        end if ;
      elsif g_inner = "001" then
        if r(0)='1' then
          -- empty
        elsif r="000" then
          g_inner <= "000";
        elsif r="010" then
          g_inner <= "010";
        elsif r="100" or r="110" then
          g_inner <= "100";
        end if;
      elsif g_inner = "010" then
        if r(1)='1' then
          -- empty
        elsif r="001" then
          g_inner <= "001";
        elsif r="100" or r="101" then
          g_inner <= "100";
        elsif r="000" then
          g_inner <= "000";
        end if;
      elsif g_inner = "100" then
        if r(2)='1' then
          -- empty
        elsif r="000" then
          g_inner <= "000";
        elsif r="001" then
          g_inner <= "001";
        elsif r="011" or r="010" then
          g_inner <= "010";
        end if ;
      end if;
    end if;
  end process;
  g <= g_inner;
end architecture ; -- arch