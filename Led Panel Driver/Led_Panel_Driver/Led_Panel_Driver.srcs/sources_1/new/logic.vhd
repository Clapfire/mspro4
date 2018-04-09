----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2018 11:15:19 AM
-- Design Name: 
-- Module Name: logic - Structural
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

entity logic is
    Port ( clk : in STD_LOGIC;
           global_rst : in STD_LOGIC;
           oe : out STD_LOGIC;
           lat : out STD_LOGIC;
           p_clk : out STD_LOGIC;
           row : out STD_LOGIC;
           la : out STD_LOGIC;
           lb : out STD_LOGIC;
           lc : out STD_LOGIC;
           ld : out STD_LOGIC;
           le : out STD_LOGIC);
end logic;

architecture Structural of logic is

component state_machine
    Port ( state : in STD_LOGIC_VECTOR (7 downto 0);
       rst : in STD_LOGIC;
       rst_state : out STD_LOGIC;
       row : out STD_LOGIC;
       oe : out STD_LOGIC;
       lat : out STD_LOGIC;
       p_clk : out STD_LOGIC);
end component;

component counter_5_bit
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       la : out STD_LOGIC;
       lb : out STD_LOGIC;
       lc : out STD_LOGIC;
       ld : out STD_LOGIC;
       le : out STD_LOGIC);
end component;

component counter_8_bit
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       count : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal rst : STD_LOGIC;
signal rowToClk : STD_LOGIC;
signal state_counter : STD_LOGIC_VECTOR(7 downto 0);


begin

c1 : state_machine PORT MAP(
                    state => state_counter,
                    rst_state => rst,
                    rst => global_rst,
                    row => rowToClk,
                    oe => oe,
                    lat => lat,
                    p_clk => p_clk);
                    
c2 : counter_5_bit PORT MAP (
                    clk => rowToClk,
                    rst => global_rst,
                    la => la,
                    lb => lb,
                    lc => lc,
                    ld => ld,
                    le => le);

c3 : counter_8_bit PORT MAP (
                    clk => clk,
                    rst => rst,
                    count => state_counter);
    row <= rowToClk;

end Structural;
