----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 11:11:24 AM
-- Design Name: 
-- Module Name: clk_devider - Behavioral
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

entity clk_divider is
    Port ( clk_in : in STD_LOGIC;
           enc_in : in STD_LOGIC_VECTOR(7 downto 0);
           clk_out : out STD_LOGIC;
           clk_out_2 : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is
    signal count: unsigned(25 downto 0);
    signal count2: unsigned(25 downto 0);
begin
    process(clk_in) begin
        if(rising_edge(clk_in)) then
            count <= count + 1;
            count2 <= count2 + 1;
        end if;
        
        if(unsigned(count2) = unsigned(enc_in & "00000000000000")) then
            clk_out_2 <= '1';
            count2 <= (others => '0');
        else
            clk_out_2 <= '0';
        end if;
    end process;
    
    clk_out <= std_logic(count(0)); --drawing frequency
--    clk_out_2 <= std_logic(count(17));  --sampling frequency

end Behavioral;
