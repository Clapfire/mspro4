-makelib xcelium_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/Vivado/2018.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Xilinx/Vivado/Vivado/2018.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_1 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Led Panel Driver V2.srcs/sources_1/ip/audio_block_mem/sim/audio_block_mem.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

