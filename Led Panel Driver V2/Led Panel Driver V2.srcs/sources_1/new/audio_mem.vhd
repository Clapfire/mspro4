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
entity audio_mem is
    Port ( write_clk : in STD_LOGIC;
           rst : in std_logic;
           data_in : in STD_LOGIC_VECTOR (4 downto 0);
           read_adr : in STD_LOGIC_VECTOR (5 downto 0);
           data_out : out STD_LOGIC_VECTOR (4 downto 0));
end audio_mem;
architecture structural of audio_mem is

    component circular_counter
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (5 downto 0));
    end component;
    
    component circular_buffer 
        Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
               read_adr : in STD_LOGIC_VECTOR (5 downto 0);
               write_adr : in STD_LOGIC_VECTOR (5 downto 0);
               write_clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               data_out : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    signal count : std_logic_vector(5 downto 0);
    
begin
c1 : circular_buffer port map(
    data_in => data_in,
    read_adr => read_adr,
    write_adr => count,
    write_clk => write_clk,
    rst => rst,
    data_out => data_out
);
c2 : circular_counter port map(
    clk => write_clk,
    rst => rst,
    output => count
);
end structural;