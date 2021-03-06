// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Mon Apr 23 14:22:22 2018
// Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel
//               Driver/Led_Panel_Driver/Led_Panel_Driver.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_stub.v}
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module blk_mem_gen_0(clka, addra, douta, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[11:0],douta[0:0],clkb,addrb[11:0],doutb[0:0]" */;
  input clka;
  input [11:0]addra;
  output [0:0]douta;
  input clkb;
  input [11:0]addrb;
  output [0:0]doutb;
endmodule
