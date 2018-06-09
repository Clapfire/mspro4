-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/Vivado/2018.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Led_Panel_Driver.srcs/sources_1/ip/clk_50/clk_50_clk_wiz.v" \
  "../../../../Led_Panel_Driver.srcs/sources_1/ip/clk_50/clk_50.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

