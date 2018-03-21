----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 10:30:19 AM
-- Design Name: 
-- Module Name: state_machine_tb - Behavioral
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

entity state_machine_tb is
--  Port ( );
end state_machine_tb;

architecture Behavioral of state_machine_tb is

component state_machine
    Port ( state : in STD_LOGIC_VECTOR (7 downto 0);
       rst_state : out STD_LOGIC;
       row : out STD_LOGIC;
       oe : out STD_LOGIC;
       lat : out STD_LOGIC;
       p_clk : out STD_LOGIC);
end component;    

signal rst_state : STD_LOGIC;
signal row : STD_LOGIC;
signal oe : STD_LOGIC;
signal lat : STD_LOGIC;
signal p_clk : STD_LOGIC;

signal state : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');

begin
uut : state_machine port map(
    state => state,
    rst_state => rst_state,
    row => row,
    oe => oe,
    lat => lat,
    p_clk => p_clk);
 
 stim_proc: process
 begin
    wait for 100 ns;
    state <= "00000001";
    
    wait for 100 ns;
    state <= "00000010";
    
    wait for 100 ns;
    state <= "00000011";
    
    wait for 100 ns;
    state <= "00000100";
    
    wait for 100 ns;
    state <= "00000101";
    
    wait for 100 ns;
    state <= "00000010";
    
    wait for 100 ns;
    state <= "10000001";
    
    wait;   
end process;

end Behavioral;
