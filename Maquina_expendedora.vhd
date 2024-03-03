library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity maquina_expendedora is
port (
  coin_in : in std_logic_vector(2 downto 0);
  clock, reset : in std_logic;
  coin_out : out std_logic_vector(2 downto 0);
  lata : out std_logic;
  empty : out std_logic
);
end maquina_expendedora;

-- ...
-- ...
architecture Behavioral of maquina_expendedora is
  type state_type is (INIT, S1);
  signal cs, ns : state_type;
  signal inventario : integer range 0 to 3 := 3;

begin
  process (clock)
  begin
    if rising_edge(clock) then
      if reset = '0' then
        cs <= INIT;
      else
        cs <= ns;
      end if;

      -- Update empty signal based on inventario
      if inventario = 0 then
        empty <= '1';
      else
        empty <= '0';
      end if;
    end if;
  end process;

  process (cs, coin_in)
  begin
    case cs is
      when INIT =>
        if coin_in = "001" and inventario > 0 then
          ns <= S1;
          lata <= '0';
          coin_out <= "000";
          inventario <= inventario - 1;
        elsif coin_in = "010" then
          ns <= INIT;
          lata <= '1';
          coin_out <= "000";
        elsif coin_in = "101" then
          ns <= INIT;
          lata <= '1';
          coin_out <= "011";
        else
          ns <= INIT;
          lata <= '0';
          coin_out <= "000";
        end if;

      when S1 =>
        if coin_in = "001" then
          ns <= INIT;
          lata <= '1';
          coin_out <= "000";
        elsif coin_in = "010" then
          ns <= INIT;
          lata <= '1';
          coin_out <= "001";
        elsif coin_in = "101" then
          ns <= INIT;
          lata <= '1';
          coin_out <= "100";
        else
          ns <= INIT;
          lata <= '0';
          coin_out <= "000";
        end if;

      when others =>
        ns <= INIT;
        lata <= '0';
        coin_out <= "000";
    end case;
  end process;

end Behavioral;