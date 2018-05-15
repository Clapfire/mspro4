----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 01:09:33 PM
-- Design Name: 
-- Module Name: rom - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity rom is
    Port ( read_adr : in STD_LOGIC_VECTOR (5 downto 0);
           data_out : out STD_LOGIC_VECTOR (4 downto 0));
end rom;
architecture Behavioral of rom is
    type rom is array(0 to 63) of std_logic_vector(4 downto 0);
    shared variable rom_0 : rom := (
        "11011",
        "11011",
        "11011",
        "11011",
        "11011",
        "11011",
        "11011",
        "11011",
        "10101",
        "10101",
        "10101",
        "10101",
        "10101",
        "10101",
        "10101",
        "10101",
        "00001",
        "00001",
        "00001",
        "00001",
        "00001",
        "00001",
        "00001",
        "00001",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "01111",
        "01111",
        "01111",
        "01111",
        "01111",
        "01111",
        "01111",
        "01111",
        "00110",
        "00110",
        "00110",
        "00110",
        "00110",
        "00110",
        "00110",
        "00110",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "11111",
        "00010",
        "00010",
        "00010",
        "00010",
        "00010",
        "00010",
        "00010",
        "00010"
    );
begin
    data_out <= rom_0(conv_integer(read_adr));
    
end Behavioral;