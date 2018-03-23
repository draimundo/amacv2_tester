onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib TopLevel_opt

do {wave.do}

view wave
view structure
view signals

do {TopLevel.udo}

run -all

quit -force
