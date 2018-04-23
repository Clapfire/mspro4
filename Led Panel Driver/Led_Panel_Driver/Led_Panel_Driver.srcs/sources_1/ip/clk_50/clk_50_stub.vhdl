-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Apr 16 16:56:36 2018
-- Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {d:/SDU/4th Semester/Semester Project/mspro4/Led Panel
--               Driver/Led_Panel_Driver/Led_Panel_Driver.srcs/sources_1/ip/clk_50/clk_50_stub.vhdl}
-- Design      : clk_50
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_50 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_50;

architecture stub of clk_50 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,clk_in1";
begin
end;
