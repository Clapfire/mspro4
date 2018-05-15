----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2018 10:02:30 AM
-- Design Name: 
-- Module Name: led_panel_driver - Structural
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

entity led_panel_driver is
    Port ( global_clk : in STD_LOGIC;
           global_rst : in STD_LOGIC;
           sw0 : in STD_LOGIC;
           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
           sw4 : in STD_LOGIC;
           button : in STD_LOGIC;
           oe : out STD_LOGIC;
           lat : out STD_LOGIC;
           la : out STD_LOGIC;
           lb : out STD_LOGIC;
           lc : out STD_LOGIC;
           ld : out STD_LOGIC;
           le : out STD_LOGIC;
           p_clk : out STD_LOGIC;
           r1 : out STD_LOGIC;
           r2 : out STD_LOGIC;
           g1 : out STD_LOGIC;
           g2 : out STD_LOGIC;
           b1 : out STD_LOGIC;
           b2 : out STD_LOGIC);
end led_panel_driver;

architecture Structural of led_panel_driver is

    component state_counter is
        Port ( global_clk : in STD_LOGIC;
               global_rst : in STD_LOGIC;
               rst : in STD_LOGIC;
               state_count : out STD_LOGIC_VECTOR);
    end component;
    
    component state_machine 
        Port ( state_count : in STD_LOGIC_VECTOR(7 downto 0);
               global_rst : in STD_LOGIC;
               r_clk : out STD_LOGIC;
               count_rst : out STD_LOGIC;
               p_clk : out STD_LOGIC;
               oe : out STD_LOGIC;
               lat : out STD_LOGIC);
    end component;
    
    component pos_counter 
        Port ( p_clk : in STD_LOGIC;
               global_rst : in STD_LOGIC;
               c : out STD_LOGIC_VECTOR (5 downto 0);
               r : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component latch_counter 
        Port ( global_rst : in STD_LOGIC;
               r_clk : in STD_LOGIC;
               la : out STD_LOGIC;
               lb : out STD_LOGIC;
               lc : out STD_LOGIC;
               ld : out STD_LOGIC;
               le : out STD_LOGIC);
    end component;
    
    component audio_mem 
        Port ( write_clk : in STD_LOGIC;
               rst : in std_logic;
               data_in : in STD_LOGIC_VECTOR (4 downto 0);
               read_adr : in STD_LOGIC_VECTOR (5 downto 0);
               data_out : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component compare 
        Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
               b : in STD_LOGIC_VECTOR (4 downto 0);
               output : out STD_LOGIC);
    end component;
    
    signal state_count : std_logic_vector(7 downto 0);
    signal count_rst :std_logic;
    signal r_clk :std_logic;
    signal p_clk_signal :std_logic;
    signal r :std_logic_vector(4 downto 0);
    signal c :std_logic_vector(5 downto 0);
    signal switches: std_logic_vector(4 downto 0) := sw4 & sw3 & sw2 & sw1 & sw0;
    signal audio_1_out : std_logic_vector(4 downto 0);
    signal colors : std_logic;
    
    
begin
        
    state_counter_1 : state_counter port map(
        global_clk => global_clk,
        global_rst => global_rst,
        rst => count_rst,
        state_count => state_count   
    );
    
    state_machine_1 : state_machine port map(
        state_count => state_count,
        global_rst => global_rst,
        r_clk => r_clk,
        count_rst => count_rst,
        p_clk => p_clk_signal,
        oe => oe,
        lat => lat 
    );
    
    p_clk <= p_clk_signal;
    
    pos_counter_1 : pos_counter port map(
        p_clk => p_clk_signal,
        global_rst => global_rst,
        c => c,
        r => r
    );
    
    latch_counter_1 : latch_counter port map(
        global_rst => global_rst,
        r_clk => r_clk,
        la => la,
        lb => lb,
        lc => lc,
        ld => ld,
        le => le
    );
    
    audio_mem_1 : audio_mem port map(
        write_clk => button,
        rst => global_rst,
        data_in => switches,
        read_adr => c,
        data_out => audio_1_out
    );
    
    compare_1 : compare port map(
        a => r,
        b => audio_1_out,
        output => colors
    );
    
    r1 <= colors;
    r2 <= colors;
    g1 <= colors;
    g2 <= colors;
    b1 <= colors;
    b2 <= colors;

end Structural;
