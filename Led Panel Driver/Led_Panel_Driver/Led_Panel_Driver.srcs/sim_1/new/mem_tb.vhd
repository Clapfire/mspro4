----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2018 10:12:32 AM
-- Design Name: 
-- Module Name: mem_tb - Behavioral
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

entity mem_tb is
--  Port ( );
end mem_tb;

architecture Behavioral of mem_tb is

component blk_mem_gen_0
        Port (addra : in STD_LOGIC_VECTOR(11 downto 0);
        clka : in STD_LOGIC;
        douta : out STD_LOGIC;
        addrb : in STD_LOGIC_VECTOR(11 downto 0);
        clkb : in STD_LOGIC;
        doutb : out STD_LOGIC);
end component;

signal addra : STD_LOGIC_VECTOR(11 downto 0);
signal clka : STD_LOGIC;
signal douta : STD_LOGIC;
signal addrb : STD_LOGIC_VECTOR(11 downto 0);
signal clkb : STD_LOGIC;
signal doutb : STD_LOGIC;

shared variable one : UNSIGNED(11 downto 0) := "000000000000";
shared variable two : UNSIGNED(11 downto 0) := "000000000000";

begin

memory : blk_mem_gen_0 port map(
                        addra => addra,
                        clka => clka,
                        douta => douta,
                        addrb => addrb,
                        clkb => clkb,
                        doutb => doutb);

stim : process
begin
    addra <= STD_LOGIC_VECTOR(one);
    addrb <= STD_LOGIC_VECTOR(two);
    wait for 10 ns;
    one := one + 1;
    two := one + 2048;

end process;

clk_proc: process
begin
    wait for 5 ns;
    clka <= '1';
    clkb <= '1';
    
    wait for 5 ns;
    clka <= '0';
    clkb <= '0';
    
end process;

end Behavioral;
