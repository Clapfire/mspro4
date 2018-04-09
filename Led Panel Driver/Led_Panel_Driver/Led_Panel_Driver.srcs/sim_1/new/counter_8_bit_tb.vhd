----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2018 09:18:04 AM
-- Design Name: 
-- Module Name: counter_8_bit_tb - Behavioral
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

entity counter_8_bit_tb is
--  Port ( );
end counter_8_bit_tb;

architecture Behavioral of counter_8_bit_tb is

component counter_8_bit
       Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              count : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk : STD_LOGIC;
signal rst : STD_LOGIC;
signal count : STD_LOGIC_VECTOR(7 downto 0);

begin
uut : counter_8_bit PORT MAP (clk => clk,
                              rst => rst,
                              count => count
                              );

reset : process
begin
    rst <= '1';
    wait for 1000 ns;
    rst <= '0';
    wait;
end process;
                              
stim_proc: process
begin
    wait for 10 ns;
    clk <= '1';
    
    wait for 10 ns;
    clk <= '0';
end process;


end Behavioral;
