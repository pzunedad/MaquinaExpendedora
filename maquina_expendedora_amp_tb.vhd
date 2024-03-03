library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity maquina_expendedora_amp_tb is
end maquina_expendedora_amp_tb;

architecture Behavioral of maquina_expendedora_amp_tb is

component maquina_expendedora is
port (
  coin_in : in std_logic_vector(2 downto 0);
  clock, reset : in std_logic;
  coin_out : out std_logic_vector(2 downto 0);
  lata : out std_logic;
  empty : out std_logic
);
end component;

signal clock, reset, lata, empty : std_logic;
signal coin_in,coin_out : std_logic_vector(2 downto 0);
constant clk_period : time := 20 ns;

begin

    process begin
        reset <= '0';
        wait for clk_period;
        reset <= '1';
        wait;
    end process;
    
    process begin
        clock <= '0';
        wait for clk_period/2;
        clock <= '1';
        wait for clk_period/2;
    end process;
    
    process begin
        wait for clk_period;
        coin_in <= "001";
        wait for clk_period;
        coin_in <= "010";
        wait for clk_period;
        coin_in <= "101";
    end process;

ampliacion: maquina_expendedora port map(coin_in,clock,reset,coin_out,lata,empty);
end Behavioral;
