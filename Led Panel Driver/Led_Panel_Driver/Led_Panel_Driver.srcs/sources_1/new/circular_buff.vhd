----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2018 02:35:24 PM
-- Design Name: 
-- Module Name: circular_buff - Struct
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
--use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity circular_buff is
    Port ( write_clk : in STD_LOGIC;
           rst : in std_logic;
           data_in : in STD_LOGIC_VECTOR (4 downto 0);
           read_adr : in STD_LOGIC_VECTOR (5 downto 0);
           data_out : out STD_LOGIC_VECTOR (4 downto 0));
end circular_buff;
architecture Struct of circular_buff is

    component counter_5_bit_buffer 
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    component circular_buffer 
        Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
               read_address : in STD_LOGIC_VECTOR (5 downto 0);
               write_address : in STD_LOGIC_VECTOR (5 downto 0);
               write_clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               data_out : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    signal count : std_logic_vector(5 downto 0);
begin
c1 : circular_buffer port map(
    data_in => data_in,
    read_address => read_adr,
    write_address => count,
    write_clk => write_clk,
    rst => rst,
    data_out => data_out
);
c2 : counter_5_bit_buffer port map(
    clk => write_clk,
    rst => rst,
    output => count
);
end Struct;