----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 10:58:19 AM
-- Design Name: 
-- Module Name: counter_8_bit - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_11_bit is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           counta : out STD_LOGIC_VECTOR (10 downto 0));
end counter_11_bit;

architecture Behavioral of counter_11_bit is

signal count_internal_a : unsigned (10 downto 0);

begin

process(clk)begin

    if(rising_edge(clk))then
        if(rst = '1') then
            count_internal_a <= "00000000000";
        else
            count_internal_a <= count_internal_a + 1;
        end if;
    end if;
    
    counta <= STD_LOGIC_VECTOR(count_internal_a);
end process;

end Behavioral;
