----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 09:10:44 AM
-- Design Name: 
-- Module Name: compare - Behavioral
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

entity compare is
    Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
           b : in STD_LOGIC_VECTOR (4 downto 0);
           clk : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           output : out STD_LOGIC);
end compare;

architecture Behavioral of compare is

begin
process(clk) begin
    
    if(falling_edge(clk)) then
        if(sw1 = '1') then
            if(std_logic_vector("01111"- signed(a)) <= b) then
                output <= '1';
            else
                output <= '0';
            end if;
        else
            if(std_logic_vector("01111"- signed(a)) = b) then
                output <= '1';
            elsif(std_logic_vector("01111" - signed(a)) = std_logic_vector((signed(b) - "00001"))) then
                output <= '1';
            elsif(std_logic_vector("01111" - signed(a)) = std_logic_vector((signed(b) + "00001"))) then
                output <= '1';
            else
                output <= '0';
            end if;
        end if;
    end if;
    
end process;

end Behavioral;
