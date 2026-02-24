# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
rows { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
cols { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
t_capacity { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
k1 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
k2 { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


set port_control_r {
A_dram { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
}
dict set axilite_register_dict control_r $port_control_r


