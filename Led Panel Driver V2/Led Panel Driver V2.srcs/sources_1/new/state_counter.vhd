----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 09:10:44 AM
-- Design Name: 
-- Module Name: state_counter - Behavioral
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

entity state_counter is
    Port ( global_clk : in STD_LOGIC;
           global_rst : in STD_LOGIC;
           rst : in STD_LOGIC;
           state_count : out STD_LOGIC_VECTOR);
end state_counter;

architecture Behavioral of state_counter is

signal count : unsigned(7 downto 0);

begin

counter : process(global_clk, global_rst) begin
    if(global_rst = '1') then
        count <= "00000000";
    elsif(rising_edge(global_clk)) then
        if(rst = '1') then
            count <= "00000000";
        else
            count <= count + 1;
        end if;
    end if;
end process;

state_count <= std_logic_vector(count);

end Behavioral;
