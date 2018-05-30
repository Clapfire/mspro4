----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2018 10:36:46 AM
-- Design Name: 
-- Module Name: encoder_color_mixer - Behavioral
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

entity encoder_color_mixer is
    Port ( position : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           enc_btn : in STD_LOGIC;
           enc_sw : in STD_LOGIC;
--           enc_btn_rdy : in STD_LOGIC;
           r_mix : out STD_LOGIC_VECTOR (7 downto 0);
           g_mix : out STD_LOGIC_VECTOR (7 downto 0);
           b_mix : out STD_LOGIC_VECTOR (7 downto 0);
           r2_mix : out STD_LOGIC_VECTOR (7 downto 0);
           g2_mix : out STD_LOGIC_VECTOR (7 downto 0);
           b2_mix : out STD_LOGIC_VECTOR (7 downto 0));
end encoder_color_mixer;

architecture Behavioral of encoder_color_mixer is

signal color : unsigned (1 downto 0);
signal position_old : unsigned(7 downto 0);
signal r1 : unsigned (7 downto 0);
signal g1 : unsigned (7 downto 0);
signal b1 : unsigned (7 downto 0);
signal r2 : unsigned (7 downto 0);
signal g2 : unsigned (7 downto 0);
signal b2 : unsigned (7 downto 0);

begin

process(enc_btn) begin
    if(rising_edge(enc_btn)) then
        color <= color + 1;
        
        if(color = "11") then
            color <= "00";
        end if;
        
    end if;
end process;

process(clk) begin
    if(rising_edge(clk)) then
        if(unsigned(position) > position_old) then
            if(enc_sw = '1') then
                if(color = "00") then
                    r1 <= r1 + "00000101";
                elsif (color = "01") then
                    g1 <= g1 + "00000101";
                elsif (color = "10") then
                    b1 <= b1 + "00000101";
                end if;
            else
                if(color = "00") then
                    r2 <= r2 + "00000101";
                elsif (color = "01") then
                    g2 <= g2 + "00000101";
                elsif (color = "10") then
                    b2 <= b2 + "00000101";
                end if;
            end if;
        elsif (unsigned(position) < position_old) then
             if(enc_sw = '1') then
                if(color = "00") then
                    r1 <= r1 - "00000101";
                elsif (color = "01") then
                    g1 <= g1 - "00000101";
                elsif (color = "10") then
                    b1 <= b1 - "00000101";
                end if;
            else
                if(color = "00") then
                    r2 <= r2 - "00000101";
                elsif (color = "01") then
                    g2 <= g2 - "00000101";
                elsif (color = "10") then
                    b2 <= b2 - "00000101";
                end if;
            end if;
        end if;
        
        position_old <= unsigned(position);
    end if;
end process;

--r1 <= unsigned(position) when color = "000" else unsigned(position) when color = "110";
--g1 <= unsigned(position) when color = "001" else unsigned(position) when color = "110";
--b1 <= unsigned(position) when color = "010" else unsigned(position) when color = "110";
--r2 <= unsigned(position) when color = "011" else unsigned(position) when color = "111";
--g2 <= unsigned(position) when color = "100" else unsigned(position) when color = "111";
--b2 <= unsigned(position) when color = "101" else unsigned(position) when color = "111";

r_mix <= std_logic_vector(r1);
g_mix <= std_logic_vector(g1);
b_mix <= std_logic_vector(b1);
r2_mix <= std_logic_vector(r2);
g2_mix <= std_logic_vector(g2);
b2_mix <= std_logic_vector(b2);


end Behavioral;
