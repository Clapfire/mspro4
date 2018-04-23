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
    Port ( Clk : in STD_LOGIC;
           global_rst : in STD_LOGIC;
           oe : out STD_LOGIC;
           lat : out STD_LOGIC;
           p_clk_out : out STD_LOGIC;
           --row : out STD_LOGIC;
           la : out STD_LOGIC;
           lb : out STD_LOGIC;
           lc : out STD_LOGIC;
           ld : out STD_LOGIC;
           le : out STD_LOGIC;
           r1 : out STD_LOGIC;
           r2 : out STD_LOGIC);
           --clk_test : out STD_LOGIC);
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

component counter_11_bit
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       counta : out STD_LOGIC_VECTOR (11 downto 0);
       countb : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component clk_50
    Port(clk_in1 : in STD_LOGIC;
       reset : in STD_LOGIC;
       clk_out1 : out STD_LOGIC);
end component;

component blk_mem_gen_0
    Port (addra : in STD_LOGIC_VECTOR(11 downto 0);
       clka : in STD_LOGIC;
       douta : out STD_LOGIC;
       addrb : in STD_LOGIC_VECTOR(11 downto 0);
       clkb : in STD_LOGIC;
       doutb : out STD_LOGIC);
end component;

component inv
    Port (inInv : in STD_LOGIC;
       outInv : out STD_LOGIC);
end component;

signal rst : STD_LOGIC;
signal rowToClk : STD_LOGIC;
signal state_counter : STD_LOGIC_VECTOR(7 downto 0);
signal clk50ToCount8 : STD_LOGIC;
signal p_clk : STD_LOGIC;
signal p_clk_inv : STD_LOGIC;
signal addra : STD_LOGIC_VECTOR(11 downto 0);
signal addrb : STD_LOGIC_VECTOR(11 downto 0);

begin

state : state_machine PORT MAP(
                    state => state_counter,
                    rst_state => rst,
                    rst => global_rst,
                    row => rowToClk,
                    oe => oe,
                    lat => lat,
                    p_clk => p_clk);
                    
       p_clk_out <= p_clk;
       
bit5 : counter_5_bit PORT MAP (
                    clk => rowToClk,
                    rst => global_rst,
                    la => la,
                    lb => lb,
                    lc => lc,
                    ld => ld,
                    le => le);

bit8 : counter_8_bit PORT MAP (
                    clk => clk50ToCount8,
                    rst => rst,
                    count => state_counter);

bit11 : counter_11_bit PORT MAP (
                    clk => p_clk,
                    rst => global_rst,
                    counta => addra,
                    countb => addrb);
                    
clk_reduced : clk_50 PORT MAP (
                    clk_in1 => Clk,
                    reset => global_rst,
                    clk_out1 => clk50ToCount8);

p_clk_inverted : inv PORT MAP (
                    inInv => p_clk,
                    outInv => p_clk_inv);
                    
memory : blk_mem_gen_0 PORT MAP (
                    addra => addra,
                    clka => p_clk_inv,
                    douta => r1,
                    addrb => addrb,
                    clkb => p_clk_inv,
                    doutb => r2);
end Structural;
