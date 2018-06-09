// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Jun  1 10:18:58 2018
// Host        : DESKTOP-4PILJD1 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {D:/SDU/4th Semester/Semester
//               Project/mspro4/Led Panel
//               Driver/Led_Panel_Driver/Led_Panel_Driver.sim/sim_1/impl/timing/xsim/logic_tb_time_impl.v}
// Design      : logic
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module LDCP_UNIQ_BASE_
   (Q,
    CLR,
    D,
    G,
    PRE);
  output Q;
  input CLR;
  input D;
  input G;
  input PRE;

  wire CLR;
  wire D;
  wire D0;
  wire G;
  wire G0;
  wire GND_1;
  wire PRE;
  wire Q;
  wire VCC_1;

  GND GND
       (.G(GND_1));
  LUT3 #(
    .INIT(8'h32)) 
    L3_1
       (.I0(PRE),
        .I1(CLR),
        .I2(D),
        .O(D0));
  LUT3 #(
    .INIT(8'hFE)) 
    L3_2
       (.I0(G),
        .I1(CLR),
        .I2(PRE),
        .O(G0));
  LDCE #(
    .INIT(1'b0)) 
    L7
       (.CLR(GND_1),
        .D(D0),
        .G(G0),
        .GE(VCC_1),
        .Q(Q));
  VCC VCC
       (.P(VCC_1));
endmodule

module counter_5_bit
   (la_OBUF,
    lb_OBUF,
    lc_OBUF,
    ld_OBUF,
    le_OBUF,
    AR,
    CLK);
  output la_OBUF;
  output lb_OBUF;
  output lc_OBUF;
  output ld_OBUF;
  output le_OBUF;
  input [0:0]AR;
  input CLK;

  wire [0:0]AR;
  wire CLK;
  wire [4:0]count_internal_reg__0;
  wire la_OBUF;
  wire lb_OBUF;
  wire lc_OBUF;
  wire ld_OBUF;
  wire le_OBUF;
  wire [4:0]plusOp__0;

  LUT1 #(
    .INIT(2'h1)) 
    \count_internal[0]_i_1__0 
       (.I0(count_internal_reg__0[0]),
        .O(plusOp__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_internal[1]_i_1__0 
       (.I0(count_internal_reg__0[0]),
        .I1(count_internal_reg__0[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_internal[2]_i_1__0 
       (.I0(count_internal_reg__0[1]),
        .I1(count_internal_reg__0[0]),
        .I2(count_internal_reg__0[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_internal[3]_i_1__0 
       (.I0(count_internal_reg__0[2]),
        .I1(count_internal_reg__0[0]),
        .I2(count_internal_reg__0[1]),
        .I3(count_internal_reg__0[3]),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_internal[4]_i_1__0 
       (.I0(count_internal_reg__0[3]),
        .I1(count_internal_reg__0[1]),
        .I2(count_internal_reg__0[0]),
        .I3(count_internal_reg__0[2]),
        .I4(count_internal_reg__0[4]),
        .O(plusOp__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \count_internal_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(plusOp__0[0]),
        .Q(count_internal_reg__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_internal_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(plusOp__0[1]),
        .Q(count_internal_reg__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_internal_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(plusOp__0[2]),
        .Q(count_internal_reg__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_internal_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(plusOp__0[3]),
        .Q(count_internal_reg__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_internal_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(plusOp__0[4]),
        .Q(count_internal_reg__0[4]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    la_reg
       (.CLR(1'b0),
        .D(count_internal_reg__0[0]),
        .G(AR),
        .GE(1'b1),
        .Q(la_OBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    lb_reg
       (.CLR(1'b0),
        .D(count_internal_reg__0[1]),
        .G(AR),
        .GE(1'b1),
        .Q(lb_OBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    lc_reg
       (.CLR(1'b0),
        .D(count_internal_reg__0[2]),
        .G(AR),
        .GE(1'b1),
        .Q(lc_OBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    ld_reg
       (.CLR(1'b0),
        .D(count_internal_reg__0[3]),
        .G(AR),
        .GE(1'b1),
        .Q(ld_OBUF));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0),
    .IS_G_INVERTED(1'b1)) 
    le_reg
       (.CLR(1'b0),
        .D(count_internal_reg__0[4]),
        .G(AR),
        .GE(1'b1),
        .Q(le_OBUF));
endmodule

module counter_8_bit
   (p_clk,
    Q,
    oe,
    CLK,
    p_clk_0,
    global_rst_IBUF,
    clk_IBUF_BUFG);
  output p_clk;
  output [0:0]Q;
  output oe;
  output CLK;
  output p_clk_0;
  input global_rst_IBUF;
  input clk_IBUF_BUFG;

  wire CLK;
  wire [0:0]Q;
  wire clk_IBUF_BUFG;
  wire \count_internal[0]_i_1_n_0 ;
  wire \count_internal[7]_i_3_n_0 ;
  wire [7:1]count_internal_reg__0;
  wire global_rst_IBUF;
  wire lat_OBUF_inst_i_2_n_0;
  wire oe;
  wire p_clk;
  wire p_clk_0;
  wire [7:1]plusOp;
  wire rst;

  LUT1 #(
    .INIT(2'h1)) 
    \count_internal[0]_i_1 
       (.I0(Q),
        .O(\count_internal[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_internal[1]_i_1 
       (.I0(Q),
        .I1(count_internal_reg__0[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
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
  LUT2 #(
    .INIT(4'h9)) 
    \count_internal[6]_i_1 
       (.I0(\count_internal[7]_i_3_n_0 ),
        .I1(count_internal_reg__0[6]),
        .O(plusOp[6]));
  LUT4 #(
    .INIT(16'hBAAA)) 
    \count_internal[7]_i_1 
       (.I0(global_rst_IBUF),
        .I1(lat_OBUF_inst_i_2_n_0),
        .I2(Q),
        .I3(count_internal_reg__0[7]),
        .O(rst));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hD2)) 
    \count_internal[7]_i_2 
       (.I0(count_internal_reg__0[6]),
        .I1(\count_internal[7]_i_3_n_0 ),
        .I2(count_internal_reg__0[7]),
        .O(plusOp[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \count_internal[7]_i_3 
       (.I0(count_internal_reg__0[4]),
        .I1(count_internal_reg__0[2]),
        .I2(Q),
        .I3(count_internal_reg__0[1]),
        .I4(count_internal_reg__0[3]),
        .I5(count_internal_reg__0[5]),
        .O(\count_internal[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\count_internal[0]_i_1_n_0 ),
        .Q(Q),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[1]),
        .Q(count_internal_reg__0[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[2]),
        .Q(count_internal_reg__0[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[3]),
        .Q(count_internal_reg__0[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[4]),
        .Q(count_internal_reg__0[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[5]),
        .Q(count_internal_reg__0[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[6]),
        .Q(count_internal_reg__0[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_internal_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(plusOp[7]),
        .Q(count_internal_reg__0[7]),
        .R(rst));
  LUT4 #(
    .INIT(16'h0040)) 
    lat_OBUF_inst_i_1
       (.I0(lat_OBUF_inst_i_2_n_0),
        .I1(Q),
        .I2(count_internal_reg__0[7]),
        .I3(global_rst_IBUF),
        .O(CLK));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    lat_OBUF_inst_i_2
       (.I0(count_internal_reg__0[5]),
        .I1(count_internal_reg__0[6]),
        .I2(count_internal_reg__0[3]),
        .I3(count_internal_reg__0[4]),
        .I4(count_internal_reg__0[2]),
        .I5(count_internal_reg__0[1]),
        .O(lat_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    oe_reg_i_1
       (.I0(count_internal_reg__0[7]),
        .I1(Q),
        .I2(lat_OBUF_inst_i_2_n_0),
        .O(p_clk_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h01)) 
    oe_reg_i_2
       (.I0(count_internal_reg__0[7]),
        .I1(Q),
        .I2(lat_OBUF_inst_i_2_n_0),
        .O(oe));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFF01)) 
    p_clk_reg_i_1
       (.I0(lat_OBUF_inst_i_2_n_0),
        .I1(Q),
        .I2(count_internal_reg__0[7]),
        .I3(global_rst_IBUF),
        .O(p_clk));
endmodule

(* ECO_CHECKSUM = "aa215980" *) 
(* NotValidForBitStream *)
module logic
   (clk,
    global_rst,
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
  input global_rst;
  output oe;
  output lat;
  output p_clk;
  output row;
  output la;
  output lb;
  output lc;
  output ld;
  output le;

  wire c3_n_0;
  wire c3_n_2;
  wire c3_n_4;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire global_rst;
  wire global_rst_IBUF;
  wire global_rst_IBUF_BUFG;
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
 $sdf_annotate("logic_tb_time_impl.sdf",,,,"tool_control");
end
  state_machine c1
       (.AR(global_rst_IBUF_BUFG),
        .Q(state_counter),
        .\count_internal_reg[0] (c3_n_0),
        .\count_internal_reg[7] (c3_n_4),
        .\count_internal_reg[7]_0 (c3_n_2),
        .oe_OBUF(oe_OBUF),
        .p_clk_OBUF(p_clk_OBUF));
  counter_5_bit c2
       (.AR(global_rst_IBUF_BUFG),
        .CLK(row_OBUF),
        .la_OBUF(la_OBUF),
        .lb_OBUF(lb_OBUF),
        .lc_OBUF(lc_OBUF),
        .ld_OBUF(ld_OBUF),
        .le_OBUF(le_OBUF));
  counter_8_bit c3
       (.CLK(row_OBUF),
        .Q(state_counter),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .global_rst_IBUF(global_rst_IBUF),
        .oe(c3_n_2),
        .p_clk(c3_n_0),
        .p_clk_0(c3_n_4));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  BUFG global_rst_IBUF_BUFG_inst
       (.I(global_rst_IBUF),
        .O(global_rst_IBUF_BUFG));
  IBUF global_rst_IBUF_inst
       (.I(global_rst),
        .O(global_rst_IBUF));
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
    \count_internal_reg[7] ,
    AR,
    \count_internal_reg[7]_0 ,
    Q,
    \count_internal_reg[0] );
  output oe_OBUF;
  output p_clk_OBUF;
  input \count_internal_reg[7] ;
  input [0:0]AR;
  input \count_internal_reg[7]_0 ;
  input [0:0]Q;
  input \count_internal_reg[0] ;

  wire [0:0]AR;
  wire [0:0]Q;
  wire \count_internal_reg[0] ;
  wire \count_internal_reg[7] ;
  wire \count_internal_reg[7]_0 ;
  wire oe_OBUF;
  wire p_clk_OBUF;

  (* INIT = "1'b0" *) 
  LDCP_UNIQ_BASE_ oe_reg
       (.CLR(AR),
        .D(1'b0),
        .G(\count_internal_reg[7] ),
        .PRE(\count_internal_reg[7]_0 ),
        .Q(oe_OBUF));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    p_clk_reg
       (.CLR(\count_internal_reg[0] ),
        .D(Q),
        .G(\count_internal_reg[7] ),
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
