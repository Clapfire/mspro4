----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2018 01:48:17 PM
-- Design Name: 
-- Module Name: row_counter - Behavioral
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

entity row_counter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           r_count_1 : out STD_LOGIC_VECTOR (5 downto 0);
           r_count_2 : out STD_LOGIC_VECTOR (5 downto 0));
end row_counter;

architecture Behavioral of row_counter is

signal count: unsigned(5 downto 0);

begin

process(clk, rst) begin
    if(rst = '1') then
        count <= "000000";
    elsif(rising_edge(clk)) then
        count <= count + 1;
    end if;
    
    r_count_1 <= STD_LOGIC_VECTOR(count);
    r_count_2 <= STD_LOGIC_VECTOR("100000" + count);
    
end process;

end Behavioral;
