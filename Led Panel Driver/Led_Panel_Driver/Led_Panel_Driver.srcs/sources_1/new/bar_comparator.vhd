----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2018 02:16:28 PM
-- Design Name: 
-- Module Name: bar_comparator - Behavioral
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

entity bar_comparator is
    Port ( row : in STD_LOGIC_VECTOR (5 downto 0);
           level : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC);
end bar_comparator;

architecture Behavioral of bar_comparator is

begin

output <= '1' when(level > row) else '0';

end Behavioral;
