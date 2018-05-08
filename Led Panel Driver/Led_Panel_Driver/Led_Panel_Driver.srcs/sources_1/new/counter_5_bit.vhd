----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 11:17:46 AM
-- Design Name: 
-- Module Name: counter_5_bit - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_5_bit is
    Port ( clk : in STD_LOGIC;
           la : out STD_LOGIC;
           lb : out STD_LOGIC;
           lc : out STD_LOGIC;
           ld : out STD_LOGIC;
           le : out STD_LOGIC;
           rst : in STD_LOGIC);
end counter_5_bit;

architecture Behavioral of counter_5_bit is

signal count_internal : unsigned (4 downto 0);

begin

process(clk, rst) begin
    if(rst = '1') then
        count_internal <= "00000";
    elsif(rising_edge(clk))then
                count_internal <= count_internal + 1;        
    end if;
end process;

    la <= STD_LOGIC(count_internal(0));
    lb <= STD_LOGIC(count_internal(1));
    lc <= STD_LOGIC(count_internal(2));
    ld <= STD_LOGIC(count_internal(3));
    le <= STD_LOGIC(count_internal(4));

end Behavioral;
