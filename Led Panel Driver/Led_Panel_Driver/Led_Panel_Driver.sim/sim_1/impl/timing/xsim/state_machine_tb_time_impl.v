// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Apr  4 09:38:51 2018
// Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/SDU/4th Semester/Semester
//               Project/mspro4/Led Panel
//               Driver/Led_Panel_Driver/Led_Panel_Driver.sim/sim_1/impl/timing/xsim/state_machine_tb_time_impl.v}
// Design      : logic
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module counter_5_bit
   (Q,
    CLK);
  output [4:0]Q;
  input CLK;

  wire CLK;
  wire [4:0]Q;
  wire [4:0]plusOp__0;

  LUT1 #(
    .INIT(2'h1)) 
    \count_internal[0]_i_1__0 
       (.I0(Q[0]),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_internal[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_internal[2]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_internal[3]_i_1__0 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_internal[4]_i_1__0 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .O(plusOp__0[4]));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp__0[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp__0[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp__0[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp__0[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(plusOp__0[4]),
        .Q(Q[4]),
        .R(1'b0));
endmodule

module counter_8_bit
   (Q,
    CLK,
    p_clk,
    p_clk_0,
    clk_IBUF_BUFG);
  output [0:0]Q;
  output CLK;
  output p_clk;
  output p_clk_0;
  input clk_IBUF_BUFG;

  wire CLK;
  wire [0:0]Q;
  wire clk_IBUF_BUFG;
  wire \count_internal[0]_i_1_n_0 ;
  wire \count_internal[7]_i_2_n_0 ;
  wire [7:1]count_internal_reg__0;
  wire lat_OBUF_inst_i_2_n_0;
  wire p_clk;
  wire p_clk_0;
  wire [7:1]plusOp;

  LUT1 #(
    .INIT(2'h1)) 
    \count_internal[0]_i_1 
       (.I0(Q),
        .O(\count_internal[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_internal[1]_i_1 
       (.I0(Q),
        .I1(count_internal_reg__0[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_internal[2]_i_1 
       (.I0(count_internal_reg__0[1]),
        .I1(Q),
        .I2(count_internal_reg__0[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_internal[3]_i_1 
       (.I0(count_internal_reg__0[2]),
        .I1(Q),
        .I2(count_internal_reg__0[1]),
        .I3(count_internal_reg__0[3]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_internal[4]_i_1 
       (.I0(count_internal_reg__0[3]),
        .I1(count_internal_reg__0[1]),
        .I2(Q),
        .I3(count_internal_reg__0[2]),
        .I4(count_internal_reg__0[4]),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_internal[5]_i_1 
       (.I0(count_internal_reg__0[4]),
        .I1(count_internal_reg__0[2]),
        .I2(Q),
        .I3(count_internal_reg__0[1]),
        .I4(count_internal_reg__0[3]),
        .I5(count_internal_reg__0[5]),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \count_internal[6]_i_1 
       (.I0(\count_internal[7]_i_2_n_0 ),
        .I1(count_internal_reg__0[6]),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hC6)) 
    \count_internal[7]_i_1 
       (.I0(count_internal_reg__0[6]),
        .I1(count_internal_reg__0[7]),
        .I2(\count_internal[7]_i_2_n_0 ),
        .O(plusOp[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \count_internal[7]_i_2 
       (.I0(count_internal_reg__0[4]),
        .I1(count_internal_reg__0[2]),
        .I2(Q),
        .I3(count_internal_reg__0[1]),
        .I4(count_internal_reg__0[3]),
        .I5(count_internal_reg__0[5]),
        .O(\count_internal[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\count_internal[0]_i_1_n_0 ),
        .Q(Q),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(count_internal_reg__0[1]),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(count_internal_reg__0[2]),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(count_internal_reg__0[3]),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(count_internal_reg__0[4]),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(count_internal_reg__0[5]),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(count_internal_reg__0[6]),
        .R(CLK));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(count_internal_reg__0[7]),
        .R(CLK));
  LUT5 #(
    .INIT(32'h00000400)) 
    lat_OBUF_inst_i_1
       (.I0(count_internal_reg__0[6]),
        .I1(count_internal_reg__0[7]),
        .I2(count_internal_reg__0[1]),
        .I3(Q),
        .I4(lat_OBUF_inst_i_2_n_0),
        .O(CLK));
  LUT4 #(
    .INIT(16'hFFFE)) 
    lat_OBUF_inst_i_2
       (.I0(count_internal_reg__0[3]),
        .I1(count_internal_reg__0[2]),
        .I2(count_internal_reg__0[5]),
        .I3(count_internal_reg__0[4]),
        .O(lat_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFBFF)) 
    oe_reg_i_1
       (.I0(lat_OBUF_inst_i_2_n_0),
        .I1(Q),
        .I2(count_internal_reg__0[1]),
        .I3(count_internal_reg__0[7]),
        .I4(count_internal_reg__0[6]),
        .O(p_clk_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    oe_reg_i_2
       (.I0(count_internal_reg__0[6]),
        .I1(count_internal_reg__0[7]),
        .I2(Q),
        .I3(count_internal_reg__0[1]),
        .I4(lat_OBUF_inst_i_2_n_0),
        .O(p_clk));
endmodule

(* ECO_CHECKSUM = "61bedc77" *) 
(* NotValidForBitStream *)
module logic
   (clk,
    oe,
    lat,
    p_clk,
    row,
    la,
    lb,
    lc,
    ld,
    le);
  input clk;
  output oe;
  output lat;
  output p_clk;
  output row;
  output la;
  output lb;
  output lc;
  output ld;
  output le;

  wire c3_n_2;
  wire c3_n_3;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire la;
  wire la_OBUF;
  wire lat;
  wire lb;
  wire lb_OBUF;
  wire lc;
  wire lc_OBUF;
  wire ld;
  wire ld_OBUF;
  wire le;
  wire le_OBUF;
  wire oe;
  wire oe_OBUF;
  wire p_clk;
  wire p_clk_OBUF;
  wire row;
  wire row_OBUF;
  wire [0:0]state_counter;

initial begin
 $sdf_annotate("state_machine_tb_time_impl.sdf",,,,"tool_control");
end
  state_machine c1
       (.\count_internal_reg[0] (c3_n_3),
        .\count_internal_reg[6] (c3_n_2),
        .oe_OBUF(oe_OBUF),
        .out(state_counter),
        .p_clk_OBUF(p_clk_OBUF));
  counter_5_bit c2
       (.CLK(row_OBUF),
        .Q({le_OBUF,ld_OBUF,lc_OBUF,lb_OBUF,la_OBUF}));
  counter_8_bit c3
       (.CLK(row_OBUF),
        .Q(state_counter),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .p_clk(c3_n_2),
        .p_clk_0(c3_n_3));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF la_OBUF_inst
       (.I(la_OBUF),
        .O(la));
  OBUF lat_OBUF_inst
       (.I(row_OBUF),
        .O(lat));
  OBUF lb_OBUF_inst
       (.I(lb_OBUF),
        .O(lb));
  OBUF lc_OBUF_inst
       (.I(lc_OBUF),
        .O(lc));
  OBUF ld_OBUF_inst
       (.I(ld_OBUF),
        .O(ld));
  OBUF le_OBUF_inst
       (.I(le_OBUF),
        .O(le));
  OBUF oe_OBUF_inst
       (.I(oe_OBUF),
        .O(oe));
  OBUF p_clk_OBUF_inst
       (.I(p_clk_OBUF),
        .O(p_clk));
  OBUF row_OBUF_inst
       (.I(row_OBUF),
        .O(row));
endmodule

module state_machine
   (oe_OBUF,
    p_clk_OBUF,
    \count_internal_reg[0] ,
    \count_internal_reg[6] ,
    out);
  output oe_OBUF;
  output p_clk_OBUF;
  input \count_internal_reg[0] ;
  input \count_internal_reg[6] ;
  input [0:0]out;

  wire \count_internal_reg[0] ;
  wire \count_internal_reg[6] ;
  wire oe_OBUF;
  wire [0:0]out;
  wire p_clk_OBUF;

  (* XILINX_LEGACY_PRIM = "LDP" *) 
  LDPE #(
    .INIT(1'b1)) 
    oe_reg
       (.D(1'b0),
        .G(\count_internal_reg[0] ),
        .GE(1'b1),
        .PRE(\count_internal_reg[6] ),
        .Q(oe_OBUF));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    p_clk_reg
       (.CLR(\count_internal_reg[6] ),
        .D(out),
        .G(\count_internal_reg[0] ),
        .GE(1'b1),
        .Q(p_clk_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
