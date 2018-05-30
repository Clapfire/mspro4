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
           r2 : out STD_LOGIC;
           g1 : out STD_LOGIC;
           g2 : out STD_LOGIC;
           b1 : out STD_LOGIC;
           b2 : out STD_LOGIC;
           
           --testing
           Dip_SW0 : in STD_LOGIC;
           Dip_SW1 : in STD_LOGIC;
           Dip_SW2 : in STD_LOGIC;
           Dip_SW3 : in STD_LOGIC;
           Dip_SW4 : in STD_LOGIC;
           
           up : in STD_LOGIC
           );
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
       le : out STD_LOGIC;
       screen : out STD_LOGIC
       );
end component;

component counter_8_bit
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       global_rst : in STD_LOGIC;
       count : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component counter_11_bit
    Port ( clk : in STD_LOGIC;
       rst : in STD_LOGIC;
       counta : out STD_LOGIC_VECTOR (10 downto 0));
end component;

component clk_50
    Port(clk_in1 : in STD_LOGIC;
       reset : in STD_LOGIC;
       clk_out1 : out STD_LOGIC);
end component;

--component clk_divider
--    Port(clk : in STD_LOGIC;
--        output : out STD_LOGIC);
--end component;

component column_counter
    port(clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        c_count : out STD_LOGIC_VECTOR(5 downto 0)
        );
end component;

component row_counter
    port(clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        r_count_1 : out STD_LOGIC_VECTOR(5 downto 0);
        r_count_2 : out STD_LOGIC_VECTOR(5 downto 0)
        );
end component;

component concater
    Port ( row : in STD_LOGIC_VECTOR (5 downto 0);
           column : in STD_LOGIC_VECTOR (5 downto 0);
           output : out STD_LOGIC_VECTOR (10 downto 0));
end component;

component bar_comparator
    Port ( row : in STD_LOGIC_VECTOR (5 downto 0);
           level : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC);
end component;

component circular_buff
    Port (write_clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR(4 downto 0);
        read_adr : in STD_LOGIC_VECTOR(5 downto 0);
        data_out : out STD_LOGIC_VECTOR(4 downto 0)
        );
end component;

component memory
    Port(clk : in STD_LOGIC;
        read_adr : in STD_LOGIC_VECTOR(10 downto 0);
        write_adr : in STD_LOGIC_VECTOR(10 downto 0);
        write_adr2 : in STD_LOGIC_VECTOR(10 downto 0);
        dat_in_1 : in STD_LOGIC;
        dat_in_2 : in STD_LOGIC;
        countClk : in STD_LOGIC;
        r1out : out STD_LOGIC_VECTOR(7 downto 0);
        r2out : out STD_LOGIC_VECTOR(7 downto 0);
        g1out : out STD_LOGIC_VECTOR(7 downto 0);
        g2out : out STD_LOGIC_VECTOR(7 downto 0);
        b1out : out STD_LOGIC_VECTOR(7 downto 0);
        b2out : out STD_LOGIC_VECTOR(7 downto 0)
        );
end component;

component color_processor
    Port ( r1 : in STD_LOGIC_VECTOR (7 downto 0);
           r2 : in STD_LOGIC_VECTOR (7 downto 0);
           g1 : in STD_LOGIC_VECTOR (7 downto 0);
           g2 : in STD_LOGIC_VECTOR (7 downto 0);
           b1 : in STD_LOGIC_VECTOR (7 downto 0);
           b2 : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           r1out : out STD_LOGIC;
           r2out : out STD_LOGIC;
           g1out : out STD_LOGIC;
           g2out : out STD_LOGIC;
           b1out : out STD_LOGIC;
           b2out : out STD_LOGIC;
           clkOut : out STD_LOGIC
           );
end component;

--testing
component switches
    Port(sw0 : in STD_LOGIC;
        sw1 : in STD_LOGIC;
        sw2 : in STD_LOGIC;
        sw3 : in STD_LOGIC;
        sw4 : in STD_LOGIC;
        switches : out STD_LOGIC_VECTOR(4 downto 0)
        );
end component;

signal rst : STD_LOGIC;
signal rowToClk : STD_LOGIC;
signal state_counter : STD_LOGIC_VECTOR(7 downto 0);
signal clk_dividerToCount8 : STD_LOGIC;
signal p_clk : STD_LOGIC;
signal addra : STD_LOGIC_VECTOR(10 downto 0);
signal clk50ToDivider : STD_LOGIC;

signal r1MemToColor : STD_LOGIC_VECTOR(7 downto 0);
signal r2MemToColor : STD_LOGIC_VECTOR(7 downto 0);
signal g1MemToColor : STD_LOGIC_VECTOR(7 downto 0);
signal g2MemToColor : STD_LOGIC_VECTOR(7 downto 0);
signal b1MemToColor : STD_LOGIC_VECTOR(7 downto 0);
signal b2MemToColor : STD_LOGIC_VECTOR(7 downto 0);
signal screenToColor : STD_LOGIC;
signal frameClk : STD_LOGIC;

signal column_count : STD_LOGIC_VECTOR(5 downto 0);
signal row_count_1 : STD_LOGIC_VECTOR(5 downto 0);
signal row_count_2 : STD_LOGIC_VECTOR(5 downto 0);

signal write_adr_1 : STD_LOGIC_VECTOR(10 downto 0);
signal write_adr_2 : STD_LOGIC_VECTOR(10 downto 0);
signal data_1 : STD_LOGIC;
signal data_2 : STD_LOGIC;
signal level_1 : STD_LOGIC_VECTOR(4 downto 0);
signal level_2 : STD_LOGIC_VECTOR(4 downto 0);

signal switches_output : STD_LOGIC_VECTOR(4 downto 0);

begin

state : state_machine PORT MAP(
                    state => state_counter,
                    rst_state => rst,
                    rst => global_rst,
                    row => rowToClk,
                    oe => oe,
                    lat => lat,
                    p_clk => p_clk
                    );
                    
       p_clk_out <= p_clk;
       
bit5 : counter_5_bit PORT MAP (
                    clk => rowToClk,
                    rst => global_rst,
                    la => la,
                    lb => lb,
                    lc => lc,
                    ld => ld,
                    le => le,
                    screen => screenToColor
                    );

bit8 : counter_8_bit PORT MAP (
                    clk => clk_dividerToCount8,
                    rst => rst,
                    global_rst => global_rst,
                    count => state_counter
                    );

bit11 : counter_11_bit PORT MAP (
                    clk => p_clk,
                    rst => global_rst,
                    counta => addra);
                    
clk_reduced : clk_50 PORT MAP (
                    clk_in1 => Clk,
                    reset => global_rst,
                    --clk_out1 => clk50ToDivider
                    clk_out1 => clk_dividerToCount8
                    );
                    
--clk_reduced_further : clk_divider PORT MAP (
--                    clk => clk50ToDivider,
--                    output => clk_dividerToCount8
--                    );

c_counter : column_counter PORT MAP (
                    clk => p_clk,
                    rst => global_rst,
                    c_count => column_count
                    );
                    
r_counter : row_counter PORT MAP (
                    clk => p_clk,
                    rst => global_rst,
                    r_count_1 => row_count_1,
                    r_count_2 => row_count_2
                    );

concate_1 : concater PORT MAP (
                    row => row_count_1,
                    column => column_count,
                    output => write_adr_1
                    );
                    
concate_2 : concater PORT MAP (
                    row => row_count_2,
                    column => column_count,
                    output => write_adr_2
                    );
                    
compare_1 : bar_comparator PORT MAP(
                    row => row_count_1,
                    level => level_1,
                    output => data_1
                    );

compare_2 : bar_comparator PORT MAP(
                    row => row_count_1,
                    level => level_2,
                    output => data_2
                    );

circular_buffer : circular_buff PORT MAP(
                    write_clk => up,
                    rst => global_rst,
                    data_in => switches_output,
                    read_adr => column_count,
                    data_out => level_1
                    );

mem : memory PORT MAP (
                    clk => p_clk,
                    read_adr => addra,
                    write_adr => write_adr_1,
                    write_adr2 => write_adr_2,
                    dat_in_1 => data_1,
                    dat_in_2 => data_2,
                    countClk => frameClk,
                    r1out => r1MemToColor,
                    r2out => r2MemToColor,
                    g1out => g1MemToColor,
                    g2out => g2MemToColor,
                    b1out => b1MemToColor,
                    b2out => b2MemToColor
                    );
                    
color : color_processor PORT MAP (
                    r1 => r1MemToColor,
                    r2 => r2MemToColor,
                    g1 => g1MemToColor,
                    g2 => g2MemToColor,
                    b1 => b1MemToColor,
                    b2 => b2MemToColor,
                    clk => screenToColor,
                    rst => global_rst,
                    r1out => r1,
                    r2out => r2,
                    g1out => g1,
                    g2out => g2,
                    b1out => b1,
                    b2out => b2,
                    clkOut => frameClk
                    );
                    
switches_1 : switches PORT MAP(
                    sw0 => Dip_SW0,
                    sw1 => Dip_SW1,
                    sw2 => Dip_SW2,
                    sw3 => Dip_SW3,
                    sw4 => Dip_SW4,
                    switches => switches_output
                    );
end Structural;
