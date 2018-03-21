----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 10:13:35 AM
-- Design Name: 
-- Module Name: state_machine - Behavioral
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

entity state_machine is
    Port ( state : in STD_LOGIC_VECTOR (7 downto 0);
           rst_state : out STD_LOGIC;
           row : out STD_LOGIC;
           oe : out STD_LOGIC;
           lat : out STD_LOGIC;
           p_clk : out STD_LOGIC);
end state_machine;

architecture Behavioral of state_machine is

begin

process(state) begin
    if(state = "00000000")then --0 0x00
    oe <= '1';
    lat <= '0';
    rst_state <= '0';
    row <= '0';
    
    elsif(state = "10000001") then --129 0x81
    lat <= '1';
    rst_state <= '1';
    row <= '1';
    
    else
        if(state(0) = '0')then --last bit 0, even
        p_clk <= '0';
        oe <= '0';
        lat <= '0';
        rst_state <= '0';
        row <= '0';
        
        else --last bit 1, odd
        p_clk <= '1';
        oe <= '0';
        lat <= '0';
        rst_state <= '0';
        row <= '0';
        end if;
        
    end if;
    
end process;

end Behavioral;
