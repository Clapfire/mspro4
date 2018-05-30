----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2018 04:13:35 PM
-- Design Name: 
-- Module Name: color_mixer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_mixer_reversed is
    Port ( input : in STD_LOGIC;
           c_count : in STD_LOGIC_VECTOR(5 downto 0);
           r_count : in STD_LOGIC_VECTOR(4 downto 0);
           clk : in STD_LOGIC;
           output : out STD_LOGIC);
end color_mixer_reversed;

architecture Behavioral of color_mixer_reversed is

signal count : UNSIGNED(10 downto 0);
signal count_2 : UNSIGNED(4 downto 0);

begin

count <= unsigned(r_count) & unsigned(c_count);

compare : process(clk) begin
    if(rising_edge(clk)) then
        if(count = "11111111111") then
            count_2 <= count_2 + 1;
        end if;
    end if;
end process;

output <= input when (unsigned(r_count) <= unsigned(count_2)) else '0';
    
end Behavioral;
