-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Wed May 16 11:02:22 2018
-- Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led
--               Panel Driver V2.srcs/sources_1/ip/audio_block_mem/audio_block_mem_stub.vhdl}
-- Design      : audio_block_mem
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity audio_block_mem is
  Port ( 
    clka : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 4 downto 0 );
    clkb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 5 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end audio_block_mem;

architecture stub of audio_block_mem is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,wea[0:0],addra[5:0],dina[4:0],clkb,addrb[5:0],doutb[4:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_1,Vivado 2018.1";
begin
end;
