transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Github/ELEC374/Lab/lpm_divida.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/lpm_mua.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/lpm_add_sua.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/register32bit.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/register64bit.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/encoder32to5.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/booth_logic.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/rol32.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/ror32.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/negate32.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/shl32.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/shr32.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/R0.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/conff_logic.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/ram_init.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/components_all.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/sel_and_encode.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/MDR.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/the_bus.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/ALU_path.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/alu.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/datapath.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/Ram_512x32.vhd}
vcom -93 -work work {D:/Github/ELEC374/Lab/control_unit.vhd}

vcom -93 -work work {D:/Github/ELEC374/Lab/control_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  control_tb

add wave *
view structure
view signals
run -all
