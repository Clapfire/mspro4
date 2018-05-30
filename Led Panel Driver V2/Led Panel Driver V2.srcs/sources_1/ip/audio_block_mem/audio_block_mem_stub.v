// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Wed May 16 11:02:22 2018
// Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver
//               V2/Led Panel Driver V2.srcs/sources_1/ip/audio_block_mem/audio_block_mem_stub.v}
// Design      : audio_block_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module audio_block_mem(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[5:0],dina[4:0],clkb,addrb[5:0],doutb[4:0]" */;
  input clka;
  input [0:0]wea;
  input [5:0]addra;
  input [4:0]dina;
  input clkb;
  input [5:0]addrb;
  output [4:0]doutb;
endmodule
