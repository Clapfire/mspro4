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
--           sw0 : in STD_LOGIC;
--           sw1 : in STD_LOGIC;
           sw2 : in STD_LOGIC;
           sw3 : in STD_LOGIC;
--           sw4 : in STD_LOGIC;
--           sw5 : in STD_LOGIC;
--           sw6 : in STD_LOGIC;
--           sw7 : in STD_LOGIC;
--           button : in STD_LOGIC;
           left_channel : in STD_LOGIC_VECTOR(4 downto 0);
           right_channel : in STD_LOGIC_VECTOR(4 downto 0);
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

    component circular_counter
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR(5 downto 0)
               );
    end component;
    
    component audio_block_mem
        Port ( addra : in STD_LOGIC_VECTOR(5 downto 0);
               clka : in STD_LOGIC;
               dina : in STD_LOGIC_VECTOR(4 downto 0);
               wea : in STD_LOGIC;
               addrb : in STD_LOGIC_VECTOR(5 downto 0);
               clkb : in STD_LOGIC;
               doutb : out STD_LOGIC_VECTOR(4 downto 0)
               );
    end component;
    
    component compare 
        Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
               b : in STD_LOGIC_VECTOR (4 downto 0);
               clk : in STD_LOGIC;
               sw2 : in STD_LOGIC;
               output : out STD_LOGIC);
    end component;
    
    component compare_reversed
        Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
               b : in STD_LOGIC_VECTOR (4 downto 0);
               clk : in STD_LOGIC;
               sw2 : in STD_LOGIC;
               output : out STD_LOGIC
               );
    end component;
    
    component clk_divider 
        Port ( clk_in : in STD_LOGIC;
               clk_out : out STD_LOGIC;
               clk_out_2 : out STD_LOGIC);
    end component; 
    
    component color_mixer
        Port ( input : in STD_LOGIC;
               c_count : in STD_LOGIC_VECTOR(5 downto 0);
               r_count : in STD_LOGIC_VECTOR(4 downto 0);
               clk : in STD_LOGIC;
               output : out STD_LOGIC);
    end component;
    
    component color_mixer_reversed
        Port ( input : in STD_LOGIC;
               c_count : in STD_LOGIC_VECTOR(5 downto 0);
               r_count : in STD_LOGIC_VECTOR(4 downto 0);
               clk : in STD_LOGIC;
               output : out STD_LOGIC);
    end component;
    
    signal state_count : std_logic_vector(7 downto 0);
    signal count_rst :std_logic;
    signal r_clk :std_logic;
    signal p_clk_signal :std_logic;
    signal r :std_logic_vector(4 downto 0);
    signal c :std_logic_vector(5 downto 0);
    signal audio_1_out : std_logic_vector(4 downto 0);
    signal audio_2_out : std_logic_vector(4 downto 0);
    signal colors_1 : std_logic;
    signal colors_1_temp_1 : std_logic;
    signal colors_1_temp_2 : std_logic;
    signal colors_2 : std_logic;
    signal colors_2_temp_1 : std_logic;
    signal colors_2_temp_2 : std_logic;
    signal red_out : std_logic;
    signal red_out_reversed : std_logic;
    signal green_out : std_logic;
    signal green_out_reversed : std_logic;
    signal blue_out : std_logic;
    signal red_out_2 : std_logic;
    signal red_out_2_reversed : std_logic;
    signal green_out_2 : std_logic;
    signal green_out_2_reversed : std_logic;
    signal blue_out_2 : std_logic;

    signal reduced_clk : std_logic;
    signal reduced_clk_2 : std_logic;
    
    signal memory_write_adr : std_logic_vector(5 downto 0);
    
begin
        
    state_counter_1 : state_counter port map(
        global_clk => reduced_clk,
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
    
    circle_counter_1 : circular_counter port map(
        clk => reduced_clk_2,
        rst => global_rst,
        output => memory_write_adr
        );

    mem_L : audio_block_mem port map(
        addra => memory_write_adr,
        clka => reduced_clk_2,
        dina => left_channel,
        wea => '1',
        addrb => c,
        clkb => p_clk_signal,
        doutb => audio_1_out
        );
        
     mem_R : audio_block_mem port map(
        addra => memory_write_adr,
        clka => reduced_clk_2,
        dina => right_channel,
        wea => '1',
        addrb => c,
        clkb => p_clk_signal,
        doutb => audio_2_out
        );
    
    compare_1 : compare port map(
        a => audio_1_out,
        b => r,
        clk => p_clk_signal,
        sw2 => sw2,
        output => colors_1_temp_1
    );
    
    compare_1_reversed : compare_reversed port map(
        a => audio_1_out,
        b => r,
        clk => p_clk_signal,
        sw2 => sw2,
        output => colors_1_temp_2
    );
    
    compare_2 : compare port map(
        a => audio_2_out,
        b => r,
        clk => p_clk_signal,
        sw2 => sw2,
        output => colors_2_temp_1
    );
    
    compare_2_reversed : compare_reversed port map(
        a => audio_2_out,
        b => r,
        clk => p_clk_signal,
        sw2 => sw2,
        output => colors_2_temp_2
    );

    
    clk_divider_1 : clk_divider port map(
        clk_in => global_clk,
        clk_out => reduced_clk,
        clk_out_2 => reduced_clk_2
    );
    
    red1 : color_mixer_reversed port map(
        input => colors_1,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => red_out
    );
    
    green1 : color_mixer port map(
        input => colors_1,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => green_out
    );
    
    red1_reversed : color_mixer port map(
        input => colors_1,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => red_out_reversed
    );
    
    green1_reversed : color_mixer_reversed port map(
        input => colors_1,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => green_out_reversed
    );
    
    red2 : color_mixer_reversed port map(
        input => colors_2,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => red_out_2
    );
    
    green2 : color_mixer port map(
        input => colors_2,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => green_out_2
    );
    
    red2_reversed : color_mixer port map(
        input => colors_2,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => red_out_2_reversed
    );

    green2_reversed : color_mixer_reversed port map(
        input => colors_2,
        c_count => c,
        r_count => r,
        clk => p_clk_signal,
        output => green_out_2_reversed
    );
    
    colors_1 <= colors_1_temp_1;
    colors_2 <= colors_2_temp_2 when sw3 = '1' else colors_2_temp_1;
    r2 <= red_out_2_reversed when sw3 = '1' else red_out_2;
    g2 <= green_out_2_reversed when sw3 = '1' else green_out_2;
    
    r1 <= red_out;
--    r2 <= red_out_2;
    g1 <= green_out;
--    g2 <= green_out_2;
    b1 <= '0';
    b2 <= '0';

end Structural;
