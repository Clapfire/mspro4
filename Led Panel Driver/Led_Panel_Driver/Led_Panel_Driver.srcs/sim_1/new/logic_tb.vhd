----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 11:34:43 AM
-- Design Name: 
-- Module Name: logic_tb - Behavioral
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

entity logic_tb is
--  Port ( );
end logic_tb;

architecture Behavioral of logic_tb is

component logic
    Port ( clk : in STD_LOGIC;
       global_rst : in STD_LOGIC;
       oe : out STD_LOGIC;
       lat : out STD_LOGIC;
       p_clk_out : out STD_LOGIC;
       la : out STD_LOGIC;
       lb : out STD_LOGIC;
       lc : out STD_LOGIC;
       ld : out STD_LOGIC;
       le : out STD_LOGIC;
       r1 : out STD_LOGIC;
       r2 : out STD_LOGIC;
       g1 : out STD_LOGIC;
       g2 : out STD_LOGIC;
       b1 : out STD_LOGIC;
       b2 : out STD_LOGIC);
end component;

signal oe : std_logic;
signal lat : std_logic;
signal p_clk : std_logic;
signal la : std_logic;
signal lb : std_logic;
signal lc : std_logic;
signal ld : std_logic;
signal le : std_logic;
signal r1 : std_logic;
signal r2 : std_logic;

signal clk : std_logic;
signal global_rst : std_logic;

begin

uut : logic port map(
        clk => clk,
        global_rst => global_rst,
        oe => oe,
        lat => lat,
        p_clk_out => p_clk,
        la => la,
        lb => lb,
        lc => lc,
        ld => ld,
        le => le,
        r1 => r1,
        r2 => r2,
        g1 => g1,
        g2 => g2,
        b1 => b1,
        b2 => b2);

reset : process begin
    global_rst <= '1';
    wait for 50 ns;
    global_rst <= '0';
    wait;
end process;

stim_proc: process
begin
    wait for 5 ns;
    clk <= '1';
    
    wait for 5 ns;
    clk <= '0';
    
end process;
end Behavioral;
