----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.12.2023 17:21:18
-- Design Name: 
-- Module Name: maquina_expendedora_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity maquina_expendedora_tb is
end maquina_expendedora_tb;

architecture Behavioral of maquina_expendedora_tb is

component maquina_expendedora is
    port(
        coin_in: in std_logic_vector(2 downto 0);
        clock,reset: in std_logic;
        coin_out: out std_logic_vector(2 downto 0);
        lata: out std_logic
    );
end component;
signal clock,reset,lata: std_logic;
signal coin_in,coin_out:std_logic_vector(2 downto 0);
constant clk_period : time := 20 ns;
begin

    process begin
        clock <='0';
        wait for clk_period/2;
        clock <= '1';
        wait for clk_period/2;
    end process;

    process begin
        reset<='0';
        wait for clk_period;
        reset <= '1';
        wait;
    end process;
    
    process begin
        wait for clk_period;
        coin_in <= "001";
        wait for clk_period;
        coin_in <= "010";
        wait for clk_period;
        coin_in <= "101";
    end process;
    
maquina: maquina_expendedora port map (
    coin_in => coin_in,
    clock => clock,
    reset => reset,
    coin_out => coin_out,
    lata => lata);


end Behavioral;
