----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 09:10:44 AM
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
    Port ( state_count : in STD_LOGIC_VECTOR(7 downto 0);
           global_rst : in STD_LOGIC;
           r_clk : out STD_LOGIC;
           count_rst : out STD_LOGIC;
           p_clk : out STD_LOGIC;
           oe : out STD_LOGIC;
           lat : out STD_LOGIC);
end state_machine;

architecture Behavioral of state_machine is

begin

process(state_count, global_rst) begin
    if(global_rst = '1') then
        count_rst <= '1';
        r_clk <= '0';
        oe <= '0';
        lat <= '0';
        p_clk <= '0';
        
    else
        if(state_count = "00000000")then --0 0x00
        oe <= '1';
        lat <= '0';
        count_rst <= '0';
        r_clk <= '0';
        p_clk <= '0';
        
        elsif(state_count = "10000001") then --129 0x81
        oe <= '0';
        lat <= '1';
        count_rst <= '1';
        r_clk <= '1';
        p_clk <= '0';
        
        else
            if(state_count(0) = '0')then --last bit 0, even
            p_clk <= '0';
            oe <= '0';
            lat <= '0';
            count_rst <= '0';
            r_clk <= '0';
           
            else --last bit 1, odd
            p_clk <= '1';
            oe <= '0';
            lat <= '0';
            count_rst <= '0';
            r_clk <= '0';
            end if;
            
        end if;
    end if;
end process;

end Behavioral;
