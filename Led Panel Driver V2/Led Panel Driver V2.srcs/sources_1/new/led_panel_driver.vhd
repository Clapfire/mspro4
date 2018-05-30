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
use IEEE.NUMERIC_STD.ALL;

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
           sw4 : in STD_LOGIC;
--           sw5 : in STD_LOGIC;
--           sw6 : in STD_LOGIC;
--           sw7 : in STD_LOGIC;
--           button : in STD_LOGIC;
           enc_1_a : in STD_LOGIC;
           enc_1_b : in STD_LOGIC;
           enc_1_sw : in STD_LOGIC;
           enc_1_btn : in STD_LOGIC;
           enc_2_a : in STD_LOGIC;
           enc_2_b : in STD_LOGIC;
           enc_2_sw : in STD_LOGIC;
           enc_2_btn : in STD_LOGIC;
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
           b2 : out STD_LOGIC;
           LED0 : out STD_LOGIC;
           LED1 : out STD_LOGIC;
           LED2 : out STD_LOGIC;
           LED3 : out STD_LOGIC;
           LED4 : out STD_LOGIC;
           LED5 : out STD_LOGIC;
           LED6 : out STD_LOGIC;
           LED7 : out STD_LOGIC);
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
               enc_in : in STD_LOGIC_VECTOR(7 downto 0);
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
    
    component encoder_color_mixer
        Port ( -- enc_dir : in STD_LOGIC;
--               enc_rdy : in STD_LOGIC;
               enc_btn : in STD_LOGIC;
               enc_sw : in STD_LOGIC;
               clk : in STD_LOGIC;
--               enc_btn_rdy : in STD_LOGIC;
               position : in STD_LOGIC_VECTOR(7 downto 0);
               r_mix : out STD_LOGIC_VECTOR (7 downto 0);
               g_mix : out STD_LOGIC_VECTOR (7 downto 0);
               b_mix : out STD_LOGIC_VECTOR (7 downto 0);
               r2_mix : out STD_LOGIC_VECTOR (7 downto 0);
               g2_mix : out STD_LOGIC_VECTOR (7 downto 0);
               b2_mix : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    component Encoder
        Port ( clk: in STD_LOGIC;
               -- signals from the pmod
               A : in  STD_LOGIC;    
               B : in  STD_LOGIC;
               BTN : in  STD_LOGIC;
               -- position of the shaft
               EncOut: inout STD_LOGIC_VECTOR (7 downto 0);
               -- direction indicator
               LED: out STD_LOGIC_VECTOR (1 downto 0));
    end component;


    component Debouncer
         Port ( clk : in  STD_LOGIC;
			   -- signals from the pmod
               Ain : in  STD_LOGIC; 
               Bin : in  STD_LOGIC;
               btnin : in STD_LOGIC;
               swin : in STD_LOGIC;
		       -- debounced signals 
			   Aout: out STD_LOGIC;
			   Bout: out STD_LOGIC;
			   btnout : out STD_LOGIC;
			   swout : out STD_LOGIC
			  );
    end component;
--    component quadrature_decoder
--        Port ( clk : in STD_LOGIC;
--               a : in STD_LOGIC;
--               b : in STD_LOGIC;
--               set_origin_n : in STD_LOGIC;
--               direction : out STD_LOGIC;
--               position : out unsigned (7 downto 0));
--    end component;
    
    component decoded_color_mixer
        Port ( color_in : in STD_LOGIC;
               color_mix_in : in STD_LOGIC_VECTOR (7 downto 0);
               row : in STD_LOGIC_VECTOR (4 downto 0);
               column : in STD_LOGIC_VECTOR (5 downto 0);
               p_clk_in : in STD_LOGIC;
               color_out : out STD_LOGIC);
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
    
    signal enc_state : unsigned(1 downto 0);
    
--  encoder signals
    signal debounced_a : std_logic;
    signal debounced_b : std_logic;
    signal debounced_btn : std_logic;
    signal debounced_sw : std_logic;
    signal enc_2_pos : std_logic_vector(7 downto 0);
    
    signal debounced_1_a : std_logic;
    signal debounced_1_b : std_logic;
    signal debounced_1_btn : std_logic;
    signal debounced_1_sw : std_logic;
    signal enc_1_pos : std_logic_vector(7 downto 0);

--  panel outputs
    signal r1_mix : std_logic_vector(7 downto 0);
    signal g1_mix : std_logic_vector(7 downto 0);
    signal b1_mix : std_logic_vector(7 downto 0);
    signal r2_mix : std_logic_vector(7 downto 0);
    signal g2_mix : std_logic_vector(7 downto 0);
    signal b2_mix : std_logic_vector(7 downto 0);
    signal r1_mixed : std_logic;
    signal g1_mixed : std_logic;
    signal b1_mixed : std_logic;
    signal r2_mixed : std_logic;
    signal g2_mixed : std_logic;
    signal b2_mixed : std_logic;
    
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
        enc_in => enc_1_pos,
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
    
    color_encoder : encoder_color_mixer port map (
--        enc_dir => enc_dir_signal,
--        enc_rdy => enc_rdy_signal,
        enc_btn => debounced_btn,
        enc_sw => debounced_sw,
        clk => global_clk,
--        enc_btn_rdy => enc_btn_rdy_signal,
        position => enc_2_pos,
        r_mix => r1_mix,
        g_mix => g1_mix,
        b_mix => b1_mix,
        r2_mix => r2_mix,
        g2_mix => g2_mix,
        b2_mix => b2_mix
    );
    
    encoder_1_debouncer : Debouncer port map (
        clk => global_clk,
        ain => enc_1_a,
        bin => enc_1_b,
        btnin => enc_1_btn,
        swin => enc_1_sw,
        aout => debounced_1_a,
        bout => debounced_1_b,
        btnout => debounced_1_btn,
        swout => debounced_1_sw
    );
    
    encoder_2_debouncer : Debouncer port map (
        clk => global_clk,
        ain => enc_2_a,
        bin => enc_2_b,
        btnin => enc_2_btn,
        swin => enc_2_sw,
        aout => debounced_a,
        bout => debounced_b,
        btnout => debounced_btn,
        swout => debounced_sw
    );
    
    sampling_encoder_decoder : Encoder port map (
        clk => global_clk,
        a => debounced_1_a,
        b => debounced_1_b,
        btn => global_rst,
        encOut => enc_1_pos
    );

       
    color_encoder_decoder : Encoder port map (
        clk => global_clk,
        a => debounced_a,
        b => debounced_b,
        btn => global_rst,
        encOut => enc_2_pos
    );

--    encoder_2_decoder : quadrature_decoder port map (
--        clk => global_clk,
--        a => enc_2_a,
--        b => enc_2_b,
--        set_origin_n => enc_2_btn,
--        direction => dir,
--        position => enc_2_position
--    );
        
    decode_mix_r1 : decoded_color_mixer port map (
        color_in => colors_1,
        color_mix_in => r1_mix,
        row => r,
        column => c,
        p_clk_in => p_clk_signal,
        color_out => r1_mixed
    );
        
    decode_mix_g1 : decoded_color_mixer port map (
        color_in => colors_1,
        color_mix_in => g1_mix,
        row => r,
        column => c,
        p_clk_in => p_clk_signal,
        color_out => g1_mixed
    );
            
    decode_mix_b1 : decoded_color_mixer port map (
        color_in => colors_1,
        color_mix_in => b1_mix,
        row => r,
        column => c,
        p_clk_in => p_clk_signal,
        color_out => b1_mixed
    );
    
    decode_mix_r2 : decoded_color_mixer port map (
        color_in => colors_2,
        color_mix_in => r2_mix,
        row => r,
        column => c,
        p_clk_in => p_clk_signal,
        color_out => r2_mixed
    );
        
    decode_mix_g2 : decoded_color_mixer port map (
        color_in => colors_2,
        color_mix_in => g2_mix,
        row => r,
        column => c,
        p_clk_in => p_clk_signal,
        color_out => g2_mixed
    );
                        
    decode_mix_b2 : decoded_color_mixer port map (
        color_in => colors_2,
        color_mix_in => b2_mix,
        row => r,
        column => c,
        p_clk_in => p_clk_signal,
        color_out => b2_mixed
    );

    state_change : process(global_clk) begin
        if(rising_edge(global_clk)) then
            if(sw4 = '1') then
                enc_state <= "10";
            else
                if(sw3 = '1') then
                    enc_state <= "01";
                else
                    enc_state <= "00";
                end if;
            end if;
        end if;
    end process;
    
    with enc_state select colors_2 <=
        colors_2_temp_1 when "00",
        colors_2_temp_2 when "01",
        colors_2_temp_1 when "10",
        colors_2_temp_1 when "11";
    
    with enc_state select r1 <=
        red_out when "00",
        red_out when "01",
        r1_mixed when "10",
        r1_mixed when "11";
        
    with enc_state select g1 <=
        green_out when "00",
        green_out when "01",
        g1_mixed when "10",
        g1_mixed when "11"; 
     
    with enc_state select b1 <=
        '0' when "00",
        '0' when "01",
        b1_mixed when "10",
        b1_mixed when "11";
    
    with enc_state select r2 <=
        red_out_2 when "00",
        red_out_2_reversed when "01",
        r2_mixed when "10",
        r2_mixed when "11";  
                        
    with enc_state select g2 <=
        green_out_2 when "00",
        green_out_2_reversed when "01",
        g2_mixed when "10",
        g2_mixed when "11";
                                
    with enc_state select b2 <=
        '0' when "00",
        '0' when "01",
        b2_mixed when "10",
        b2_mixed when "11";       

    LED0 <= enc_1_pos(0);
    LED1 <= enc_1_pos(1);
    LED2 <= enc_1_pos(2);
    LED3 <= enc_1_pos(3);
    LED4 <= enc_1_pos(4);
    LED5 <= enc_1_pos(5);
    LED6 <= enc_1_pos(6);
    LED7 <= enc_1_pos(7);
    
    colors_1 <= colors_1_temp_1;
--    colors_2 <= colors_2_temp_2 when sw3 = '1' else colors_2_temp_1;
--    r2 <= red_out_2_reversed when sw3 = '1' else red_out_2;
--    g2 <= green_out_2_reversed when sw3 = '1' else green_out_2;
    
--    r1 <= red_out;
--    r2 <= red_out_2;
--    g1 <= green_out;
--    g2 <= green_out_2;
--    b1 <= '0';
--    b2 <= '0';
    

end Structural;
