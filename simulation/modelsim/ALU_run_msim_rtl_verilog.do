transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/SHIFT_LEFT.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/GATE_OR.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/GATE_NOT.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/GATE_AND.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/ALU.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ALU {C:/intelFPGA_lite/18.1/ALU/MUX.sv}

