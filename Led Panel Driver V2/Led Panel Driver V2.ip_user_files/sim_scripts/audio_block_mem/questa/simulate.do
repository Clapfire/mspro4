onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib audio_block_mem_opt

do {wave.do}

view wave
view structure
view signals

do {audio_block_mem.udo}

run -all

quit -force
