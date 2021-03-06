// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed May  9 11:37:49 2018
// Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel
//               Driver/Led_Panel_Driver/Led_Panel_Driver.srcs/sources_1/ip/clk_50/clk_50_stub.v}
// Design      : clk_50
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_50(clk_out1, reset, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,reset,clk_in1" */;
  output clk_out1;
  input reset;
  input clk_in1;
endmodule
