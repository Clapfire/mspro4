set_property SRC_FILE_INFO {cfile:{d:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver/Led_Panel_Driver/Led_Panel_Driver.srcs/sources_1/ip/clk_50/clk_50.xdc} rfile:../Led_Panel_Driver.srcs/sources_1/ip/clk_50/clk_50.xdc id:1 order:EARLY scoped_inst:clk_reduced/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
