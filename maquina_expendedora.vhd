----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2023 17:28:26
-- Design Name: 
-- Module Name: maquina_expendedora - Behavioral
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

entity maquina_expendedora is
    port(
        coin_in: in std_logic_vector(2 downto 0);
        clock,reset: in std_logic;
        coin_out: out std_logic_vector(2 downto 0);
        lata: out std_logic
    );
end maquina_expendedora;

architecture Behavioral of maquina_expendedora is
    type state_type is(INIT,S1);
    signal cs,ns : state_type;
begin
    process(clock,reset)
    begin
       if(reset='0') then 
            cs<=INIT;
       elsif(rising_edge(clock)) then
            cs <= ns;
       end if;
    end process;
    
    process(cs,coin_in,clock)
    begin
        case cs is
            when INIT =>
                if coin_in="001" then ns<=S1; lata<='0'; coin_out<="000";
                elsif coin_in="010" then ns<=INIT; lata<='1'; coin_out<="000";
                elsif coin_in="101" then ns<=INIT; lata<='1'; coin_out<="011";
                else ns<=INIT; lata<='0'; coin_out<="000";
                end if;
             when S1 =>
                if coin_in="001" then ns<=INIT; lata<='1'; coin_out<="000";
                elsif coin_in="010" then ns<=INIT; lata<='1'; coin_out<="001";
                elsif coin_in="101" then ns<=INIT; lata<='1'; coin_out<="100";
                else ns<=INIT; lata<='0'; coin_out<="000";
                end if;
             when others =>
                ns<=INIT; lata<='0'; coin_out<="000";
        end case;
    end process;
    
end Behavioral;
