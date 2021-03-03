transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Quartus/Datapath/lpm_divida.vhd}
vcom -93 -work work {D:/Quartus/Datapath/lpm_mua.vhd}
vcom -93 -work work {D:/Quartus/Datapath/lpm_add_sua.vhd}
vcom -93 -work work {D:/Quartus/Datapath/register32bit.vhd}
vcom -93 -work work {D:/Quartus/Datapath/register64bit.vhd}
vcom -93 -work work {D:/Quartus/Datapath/encoder32to5.vhd}
vcom -93 -work work {D:/Quartus/Datapath/booth_logic.vhd}
vcom -93 -work work {D:/Quartus/Datapath/rol32.vhd}
vcom -93 -work work {D:/Quartus/Datapath/ror32.vhd}
vcom -93 -work work {D:/Quartus/Datapath/components_all.vhd}
vcom -93 -work work {D:/Quartus/Datapath/negate32.vhd}
vcom -93 -work work {D:/Quartus/Datapath/shl32.vhd}
vcom -93 -work work {D:/Quartus/Datapath/shr32.vhd}
vcom -93 -work work {D:/Quartus/Datapath/MDR.vhd}
vcom -93 -work work {D:/Quartus/Datapath/the_bus.vhd}
vcom -93 -work work {D:/Quartus/Datapath/ALU_path.vhd}
vcom -93 -work work {D:/Quartus/Datapath/alu.vhd}
vcom -93 -work work {D:/Quartus/Datapath/datapath.vhd}

vcom -93 -work work {D:/Quartus/Datapath/datapath_and_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  datapath_and_tb

add wave *
view structure
view signals
run -all
