----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 09:10:44 AM
-- Design Name: 
-- Module Name: pos_counter - Behavioral
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

entity pos_counter is
    Port ( p_clk : in STD_LOGIC;
           global_rst : in STD_LOGIC;
           c : out STD_LOGIC_VECTOR (5 downto 0);
           r : out STD_LOGIC_VECTOR (4 downto 0));
end pos_counter;

architecture Behavioral of pos_counter is

signal count : unsigned (10 downto 0);

begin

process(p_clk, global_rst)begin
    if(global_rst = '1') then
        count <= "00000000000";
    elsif(rising_edge(p_clk))then
        count <= count + 1;
    end if;
    
    c <= std_logic_vector(count(5 downto 0)); --use first 6 bits for column
    r <= std_logic_vector(count(10 downto 6)); --use last 5 bits for row
    
end process;

end Behavioral;
