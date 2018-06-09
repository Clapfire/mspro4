# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/.Xil/Vivado-16592-DESKTOP-4PILJD1/incrSyn}
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.cache/wt} [current_project]
set_property parent.project_path {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.xpr} [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part em.avnet.com:zed:part0:1.4 [current_project]
set_property ip_output_repo {d:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/ADAU1761_interface.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/Debouncer_Digilent.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/adau1761_configuraiton_data.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/adau1761_izedboard.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/audio_top.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/circular_counter.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/clk_devider.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/clocking.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/color_mixer.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/color_mixer_reversed.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/compare.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/compare_reversed.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/decoded_color_mixer.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/encoder_color_mixer.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/encoder_decoder.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/i2c.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/i2s_data_interface.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/i3c2.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/latch_counter.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/led_panel_driver.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/pos_counter.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/state_counter.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/state_machine.vhd}
  {D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/new/audioToVisual.vhd}
}
read_ip -quiet {{D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/ip/audio_block_mem/audio_block_mem.xci}}
set_property used_in_implementation false [get_files -all {{d:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/sources_1/ip/audio_block_mem/audio_block_mem_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/constrs_1/new/zedboard.xdc}}
set_property used_in_implementation false [get_files {{D:/SDU/4th Semester/Semester Project/mspro4/Led Panel Driver V2/Led Panel Driver V2.srcs/constrs_1/new/zedboard.xdc}}]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top audioToVisual -part xc7z020clg484-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef audioToVisual.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file audioToVisual_utilization_synth.rpt -pb audioToVisual_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
