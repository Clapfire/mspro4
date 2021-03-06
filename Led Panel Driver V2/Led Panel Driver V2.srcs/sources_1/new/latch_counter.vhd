----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 09:10:44 AM
-- Design Name: 
-- Module Name: latch_counter - Behavioral
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

entity latch_counter is
    Port ( global_rst : in STD_LOGIC;
           r_clk : in STD_LOGIC;
           la : out STD_LOGIC;
           lb : out STD_LOGIC;
           lc : out STD_LOGIC;
           ld : out STD_LOGIC;
           le : out STD_LOGIC);
end latch_counter;

architecture Behavioral of latch_counter is

signal count : unsigned(4 downto 0);

begin

counter : process(r_clk, global_rst) begin
    
    if(global_rst = '1') then
        count <= "11111";
    elsif(rising_edge(r_clk)) then
        count <= count + 1;
    end if;
    
end process;

    la <= STD_LOGIC(count(0));
    lb <= STD_LOGIC(count(1));
    lc <= STD_LOGIC(count(2));
    ld <= STD_LOGIC(count(3));
    le <= STD_LOGIC(count(4));

end Behavioral;
