----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2018 01:44:43 PM
-- Design Name: 
-- Module Name: decoded_color_mixer - Behavioral
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

entity decoded_color_mixer is
    Port ( color_in : in STD_LOGIC;
           color_mix_in : in STD_LOGIC_VECTOR (7 downto 0);
           row : in STD_LOGIC_VECTOR (4 downto 0);
           column : in STD_LOGIC_VECTOR (5 downto 0);
           p_clk_in : in STD_LOGIC;
           color_out : out STD_LOGIC);
end decoded_color_mixer;

architecture Behavioral of decoded_color_mixer is

signal count : unsigned (7 downto 0);

begin

process(p_clk_in) begin
    if(rising_edge(p_clk_in)) then
        if((row & column) = "11111111111") then
            count <= count + 1;
        end if;
    end if;
end process;

color_out <= color_in when (unsigned(color_mix_in) > count) else '0';


end Behavioral;
