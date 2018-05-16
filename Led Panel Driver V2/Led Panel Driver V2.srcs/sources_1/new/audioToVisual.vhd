----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/16/2018 12:56:41 PM
-- Design Name: 
-- Module Name: audioToVisual - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity audioToVisual is
    Port ( clk_100  : in    STD_LOGIC; -- 100 mhz master takt 
           global_rst : in  STD_LOGIC;
           AC_ADR0  : out   STD_LOGIC;  -- control signals to ADAU chip
           AC_ADR1  : out   STD_LOGIC;
           AC_GPIO0 : out   STD_LOGIC;  -- I2S MISO
           AC_GPIO1 : in    STD_LOGIC;  -- I2S MOSI
           AC_GPIO2 : in    STD_LOGIC;  -- I2S_bclk
           AC_GPIO3 : in    STD_LOGIC;  -- I2S_LR
           AC_MCLK  : out   STD_LOGIC;
           AC_SCK   : out   STD_LOGIC;
           AC_SDA   : inout STD_LOGIC;
           SW1 : in STD_LOGIC;
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
           b2 : out STD_LOGIC
           );
end audioToVisual;

architecture Behavioral of audioToVisual is

COMPONENT audio_top
Port ( clk_100  : in    STD_LOGIC; -- 100 mhz input clock 
       AC_ADR0  : out   STD_LOGIC; -- contol signals to audio chip
       AC_ADR1  : out   STD_LOGIC;
       AC_GPIO0 : out   STD_LOGIC;  -- I2S MISO
       AC_GPIO1 : in    STD_LOGIC;  -- I2S MOSI
       AC_GPIO2 : in    STD_LOGIC;  -- I2S_bclk
       AC_GPIO3 : in    STD_LOGIC;  -- I2S_LR
       AC_MCLK  : out   STD_LOGIC;
       AC_SCK   : out   STD_LOGIC;
       AC_SDA   : inout STD_LOGIC;

       hphone_l  : in STD_LOGIC_VECTOR(23 downto 0);
       hphone_l_valid : in std_logic;
       hphone_r  : in STD_LOGIC_VECTOR(23 downto 0);
       hphone_r_valid_dummy : in std_logic;
       
       line_in_l    : out STD_LOGIC_VECTOR(23 downto 0);
       line_in_r    : out STD_LOGIC_VECTOR(23 downto 0);
       
       new_sample : out STD_LOGIC;     -- goes up for 1 clk cycle if new sample is transmitted received
       sample_clk_48k : out std_logic  -- sample clock 
       );
END COMPONENT;

COMPONENT led_panel_driver
    port( global_clk : in STD_LOGIC;
          global_rst : in STD_LOGIC;
          left_channel : in STD_LOGIC_VECTOR(4 downto 0);
          right_channel : in STD_LOGIC_VECTOR(4 downto 0);
          sw1 : in STD_LOGIC;
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
          b2 : out STD_LOGIC
          );
END COMPONENT;

    signal clk_100_buffered: std_logic;

    signal hphone_l, hphone_r : std_logic_vector (23 downto 0);
    signal line_in_l_5bit : std_logic_vector (4 downto 0);
    signal line_in_r_5bit : std_logic_vector (4 downto 0);
    signal hphone_valid: std_logic;
    signal new_sample : std_logic;
    signal sample_clk_48k: std_logic;
    signal line_in_l, line_in_r : std_logic_vector (23 downto 0);

    -- keep signals for tracking them with the Logic Analyzer
    attribute keep : string;
    attribute keep of sample_clk_48k : signal is "true";
    attribute keep of hphone_l : signal is "true";
    attribute keep of hphone_r : signal is "true";
    
    attribute keep of line_in_l : signal is "true";
    attribute keep of line_in_l_5bit : signal is "true";
    attribute keep of line_in_r : signal is "true";

begin

i_audio : audio_top port map (
      clk_100  => clk_100_buffered, 
      AC_ADR0  => AC_ADR0,
      AC_ADR1  => AC_ADR1,
      AC_GPIO0 => AC_GPIO0,
      AC_GPIO1 => AC_GPIO1,
      AC_GPIO2 => AC_GPIO2,
      AC_GPIO3 => AC_GPIO3,
      AC_MCLK  => AC_MCLK,
      AC_SCK   => AC_SCK,
      AC_SDA   => AC_SDA,
      
      hphone_l  => hphone_l,
      hphone_l_valid => hphone_valid,
      hphone_r  => hphone_r,
      hphone_r_valid_dummy => hphone_valid,   --  this valid will be discarded later
      
      line_in_l => line_in_l,  
      line_in_r => line_in_r,

      new_sample => new_sample,
      sample_clk_48k => sample_clk_48k    
   );

led_driver: led_panel_driver port map (
      global_clk => clk_100_buffered,
      global_rst => global_rst,
      oe => oe,
      lat => lat, 
      la => la,
      lb => lb,
      lc => lc,
      ld => ld,
      le => le,
      p_clk => p_clk,
      r1 => r1,
      r2 => r2,
      g1 => g1,
      g2 => g2,
      b1 => b1,
      b2 => b2,
      sw1 => SW1,
      left_channel => line_in_l_5bit,
      right_channel => line_in_r_5bit
      );

BUFG_inst : BUFG
    port map (
       O => clk_100_buffered,   -- 1-bit output: Clock output
       I => clk_100             -- 1-bit input: Clock input
    );  

transfer_audio: process(clk_100)
begin
    if(rising_edge(clk_100)) then
        if (new_sample = '1') then
            line_in_l_5bit <= line_in_l(23 downto 19);
            line_in_r_5bit <= line_in_r(23 downto 19);
        end if;
    end if;
end process;

end Behavioral;
