----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2018 02:13:33 PM
-- Design Name: 
-- Module Name: concater - Behavioral
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

entity concater is
    Port ( row : in STD_LOGIC_VECTOR (5 downto 0);
           column : in STD_LOGIC_VECTOR (5 downto 0);
           output : out STD_LOGIC_VECTOR (10 downto 0));
end concater;

architecture Behavioral of concater is

begin

output <= row(4 downto 0) & column;

end Behavioral;
