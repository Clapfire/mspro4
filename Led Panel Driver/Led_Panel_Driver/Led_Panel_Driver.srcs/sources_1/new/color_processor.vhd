----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2018 09:31:13 AM
-- Design Name: 
-- Module Name: color_processor - Behavioral
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

entity color_processor is
    Port ( r1 : in STD_LOGIC_VECTOR (7 downto 0);
           r2 : in STD_LOGIC_VECTOR (7 downto 0);
           g1 : in STD_LOGIC_VECTOR (7 downto 0);
           g2 : in STD_LOGIC_VECTOR (7 downto 0);
           b1 : in STD_LOGIC_VECTOR (7 downto 0);
           b2 : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           r1out : out STD_LOGIC;
           r2out : out STD_LOGIC;
           g1out : out STD_LOGIC;
           g2out : out STD_LOGIC;
           b1out : out STD_LOGIC;
           b2out : out STD_LOGIC);
end color_processor;

architecture Behavioral of color_processor is

signal count : unsigned(7 downto 0);

begin

counter : process(clk, rst) begin
    if(rst = '1') then
        count <= "00000000";
    elsif(rising_edge(clk))then
        count <= count + 1;
    end if;
end process;

red : process(r1) begin
    if(unsigned(r1) > count)then
        r1out <= '1';
    else
        r1out <= '0';
    end if;
end process;

red2 : process(r2) begin
    if(unsigned(r2) > count)then
        r2out <= '1';
    else
        r2out <= '0';
    end if;
end process;

green : process(g1) begin
    if(unsigned(g1) > count)then
        g1out <= '1';
    else
        g1out <= '0';
    end if;
end process;

green2 : process(g2) begin
    if(unsigned(g2) > count)then
        g2out <= '1';
    else
        g2out <= '0';
    end if;
end process;

blue : process(b1) begin
    if(unsigned(b1) > count)then
        b1out <= '1';
    else
        b1out <= '0';
    end if;
end process;

blue2 : process(b2) begin
    if(unsigned(b2) > count)then
        b2out <= '1';
    else
        b2out <= '0';
    end if;
end process;

end Behavioral;
