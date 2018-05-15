----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2018 02:02:38 PM
-- Design Name: 
-- Module Name: circular_buffer - Behavioral
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
entity circular_buffer is
    Port ( data_in : in STD_LOGIC_VECTOR (4 downto 0);
           read_address : in STD_LOGIC_VECTOR (5 downto 0);
           write_address : in STD_LOGIC_VECTOR (5 downto 0);
           write_clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (4 downto 0));
end circular_buffer;
architecture Behavioral of circular_buffer is
    type ram is array(0 to 63) of std_logic_vector(4 downto 0);
    signal ram_0 : ram;
begin
    write_proc : process(write_clk, rst) begin
        if(rst = '1') then
             for i in 0 to 63 loop
                ram_0(i) <= "00000";
             end loop;
        elsif(falling_edge(write_clk)) then
            ram_0(conv_integer(write_address)) <= data_in;
        end if;
    end process;
    
    read_proc : process(write_clk) begin
        data_out <= ram_0(conv_integer(read_address));
    end process;
end Behavioral;