#INPUTS
#set_property PACKAGE_PIN Y9 [get_ports global_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports global_clk]
set_property PACKAGE_PIN P16 [get_ports global_rst]
set_property IOSTANDARD LVCMOS18 [get_ports global_rst]
set_property PACKAGE_PIN F22 [get_ports sw0]
set_property IOSTANDARD LVCMOS18 [get_ports sw0]
set_property PACKAGE_PIN G22 [get_ports SW1]
set_property IOSTANDARD LVCMOS18 [get_ports SW1]
set_property PACKAGE_PIN H22 [get_ports sw2]
set_property IOSTANDARD LVCMOS18 [get_ports sw2]
set_property PACKAGE_PIN F21 [get_ports sw3]
set_property IOSTANDARD LVCMOS18 [get_ports sw3]
set_property PACKAGE_PIN H19 [get_ports sw4]
set_property IOSTANDARD LVCMOS18 [get_ports sw4]
set_property PACKAGE_PIN T18 [get_ports button]
set_property IOSTANDARD LVCMOS18 [get_ports button]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets button_IBUF]

#OUTPUTS
set_property PACKAGE_PIN Y11 [get_ports oe]
set_property IOSTANDARD LVCMOS33 [get_ports oe]
set_property PACKAGE_PIN AA11 [get_ports lat]
set_property IOSTANDARD LVCMOS33 [get_ports lat]
set_property PACKAGE_PIN AA9 [get_ports p_clk]
set_property IOSTANDARD LVCMOS33 [get_ports p_clk]
set_property PACKAGE_PIN AB11 [get_ports r1]
set_property IOSTANDARD LVCMOS33 [get_ports r1]
set_property PACKAGE_PIN AB10 [get_ports r2]
set_property IOSTANDARD LVCMOS33 [get_ports r2]
set_property PACKAGE_PIN AB9 [get_ports g1]
set_property IOSTANDARD LVCMOS33 [get_ports g1]
set_property PACKAGE_PIN AA8 [get_ports g2]
set_property IOSTANDARD LVCMOS33 [get_ports g2]
set_property PACKAGE_PIN W12 [get_ports la]
set_property IOSTANDARD LVCMOS33 [get_ports la]
set_property PACKAGE_PIN W11 [get_ports lb]
set_property IOSTANDARD LVCMOS33 [get_ports lb]
set_property PACKAGE_PIN V10 [get_ports lc]
set_property IOSTANDARD LVCMOS33 [get_ports lc]
set_property PACKAGE_PIN W8 [get_ports ld]
set_property IOSTANDARD LVCMOS33 [get_ports ld]
set_property PACKAGE_PIN V12 [get_ports le]
set_property IOSTANDARD LVCMOS33 [get_ports le]
set_property PACKAGE_PIN W10 [get_ports b1]
set_property IOSTANDARD LVCMOS33 [get_ports b1]
set_property PACKAGE_PIN V9 [get_ports b2]
set_property IOSTANDARD LVCMOS33 [get_ports b2]

#AUDIO
# timing constraints
create_clock -period 10.000 -name clk_100 [get_ports clk_100]
set_false_path -from [get_clocks zed_audio_clk_48M] -to [get_clocks clk_100]
set_false_path -from [get_clocks clk_100] -to [get_clocks zed_audio_clk_48M]
# 100 mhz clock
set_property PACKAGE_PIN Y9 [get_ports clk_100]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100]
# 24 mhz clock to audio chip
set_property PACKAGE_PIN AB2 [get_ports AC_MCLK]
set_property IOSTANDARD LVCMOS33 [get_ports AC_MCLK]
# I2S transfers audio samples
# i2s bit clock to ADAU1761
set_property PACKAGE_PIN Y8 [get_ports AC_GPIO0]
set_property IOSTANDARD LVCMOS33 [get_ports AC_GPIO0]
# i2s bit clock from ADAU1761
set_property PACKAGE_PIN AA7 [get_ports AC_GPIO1]
set_property IOSTANDARD LVCMOS33 [get_ports AC_GPIO1]
# i2s bit clock from ADAU1761
set_property PACKAGE_PIN AA6 [get_ports AC_GPIO2]
set_property IOSTANDARD LVCMOS33 [get_ports AC_GPIO2]
# i2s l/r 48 khz toggling signal from ADAU1761 (sample clock)
set_property PACKAGE_PIN Y6 [get_ports AC_GPIO3]
set_property IOSTANDARD LVCMOS33 [get_ports AC_GPIO3]
# I2C Data Interface to ADAU1761 (for configuration)
set_property PACKAGE_PIN AB4 [get_ports AC_SCK]
set_property IOSTANDARD LVCMOS33 [get_ports AC_SCK]
set_property PACKAGE_PIN AB5 [get_ports AC_SDA]
set_property IOSTANDARD LVCMOS33 [get_ports AC_SDA]
set_property PACKAGE_PIN AB1 [get_ports AC_ADR0]
set_property IOSTANDARD LVCMOS33 [get_ports AC_ADR0]
set_property PACKAGE_PIN Y5 [get_ports AC_ADR1]
set_property IOSTANDARD LVCMOS33 [get_ports AC_ADR1]