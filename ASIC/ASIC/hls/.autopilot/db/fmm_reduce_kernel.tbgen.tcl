set moduleName fmm_reduce_kernel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 18
set C_modelName {fmm_reduce_kernel}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ A_dram int 32 regular {pointer 2}  }
	{ rows int 32 regular  }
	{ cols int 32 regular  }
	{ t_capacity int 32 regular  }
	{ k1 int 32 regular  }
	{ k2 int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "A_dram", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "rows", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cols", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "t_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_dram_i sc_in sc_lv 32 signal 0 } 
	{ A_dram_o sc_out sc_lv 32 signal 0 } 
	{ rows sc_in sc_lv 32 signal 1 } 
	{ cols sc_in sc_lv 32 signal 2 } 
	{ t_capacity sc_in sc_lv 32 signal 3 } 
	{ k1 sc_in sc_lv 32 signal 4 } 
	{ k2 sc_in sc_lv 32 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_dram_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_dram", "role": "i" }} , 
 	{ "name": "A_dram_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_dram", "role": "o" }} , 
 	{ "name": "rows", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "default" }} , 
 	{ "name": "cols", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "default" }} , 
 	{ "name": "t_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "t_capacity", "role": "default" }} , 
 	{ "name": "k1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k1", "role": "default" }} , 
 	{ "name": "k2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k2", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	fmm_reduce_kernel {
		A_dram {Type IO LastRead 0 FirstWrite 4}
		rows {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		t_capacity {Type I LastRead 0 FirstWrite -1}
		k1 {Type I LastRead 2 FirstWrite -1}
		k2 {Type I LastRead 2 FirstWrite -1}
		M_rows {Type IO LastRead -1 FirstWrite -1}
		M_cols {Type IO LastRead -1 FirstWrite -1}
		M_t {Type IO LastRead -1 FirstWrite -1}
		M_t_capacity {Type IO LastRead -1 FirstWrite -1}
		M_e_0 {Type IO LastRead -1 FirstWrite -1}
		M_e_1 {Type IO LastRead -1 FirstWrite -1}
		M_e_2 {Type IO LastRead -1 FirstWrite -1}
		M_e_3 {Type IO LastRead -1 FirstWrite -1}}
	load_matrix_from_dram {
		A_dram_read {Type I LastRead 2 FirstWrite -1}
		rows {Type I LastRead 1 FirstWrite -1}
		cols {Type I LastRead 1 FirstWrite -1}
		t_capacity {Type I LastRead 0 FirstWrite -1}
		M_rows {Type O LastRead -1 FirstWrite 1}
		M_cols {Type O LastRead -1 FirstWrite 1}
		M_t {Type O LastRead -1 FirstWrite 3}
		M_t_capacity {Type O LastRead -1 FirstWrite 0}
		M_e_0 {Type O LastRead -1 FirstWrite 2}
		M_e_1 {Type O LastRead -1 FirstWrite 2}
		M_e_2 {Type O LastRead -1 FirstWrite 2}
		M_e_3 {Type O LastRead -1 FirstWrite 2}}
	load_matrix_from_dram_Pipeline_VITIS_LOOP_49_1_VITIS_LOOP_51_2 {
		M_e_0 {Type O LastRead -1 FirstWrite 2}
		M_e_1 {Type O LastRead -1 FirstWrite 2}
		M_e_2 {Type O LastRead -1 FirstWrite 2}
		M_e_3 {Type O LastRead -1 FirstWrite 2}}
	load_matrix_from_dram_Pipeline_VITIS_LOOP_56_3_VITIS_LOOP_57_4 {
		cols {Type I LastRead 0 FirstWrite -1}
		bound5 {Type I LastRead 0 FirstWrite -1}
		A_dram_read {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type O LastRead -1 FirstWrite 3}
		M_e_1 {Type O LastRead -1 FirstWrite 3}
		M_e_2 {Type O LastRead -1 FirstWrite 3}
		M_e_3 {Type O LastRead -1 FirstWrite 3}}
	greedy_potential_reduce {
		k1 {Type I LastRead 0 FirstWrite -1}
		k2 {Type I LastRead 0 FirstWrite -1}
		M_rows {Type I LastRead 3 FirstWrite -1}
		M_t {Type IO LastRead 3 FirstWrite 4}
		M_cols {Type I LastRead 9 FirstWrite -1}
		M_e_0 {Type IO LastRead 1 FirstWrite -1}
		M_e_1 {Type IO LastRead 1 FirstWrite -1}
		M_e_2 {Type IO LastRead 1 FirstWrite -1}
		M_e_3 {Type IO LastRead 1 FirstWrite -1}
		M_t_capacity {Type I LastRead 3 FirstWrite -1}}
	find_best_move {
		k1 {Type I LastRead 0 FirstWrite -1}
		k2 {Type I LastRead 0 FirstWrite -1}
		M_rows {Type I LastRead 3 FirstWrite -1}
		M_t {Type IO LastRead 3 FirstWrite 18}
		M_cols {Type I LastRead 9 FirstWrite -1}
		M_e_0 {Type IO LastRead 1 FirstWrite -1}
		M_e_1 {Type IO LastRead 1 FirstWrite -1}
		M_e_2 {Type IO LastRead 1 FirstWrite -1}
		M_e_3 {Type IO LastRead 1 FirstWrite -1}
		M_t_capacity {Type I LastRead 3 FirstWrite -1}}
	compute_pp_nn {
		r1 {Type I LastRead 0 FirstWrite -1}
		r2 {Type I LastRead 0 FirstWrite -1}
		M_cols {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type I LastRead 1 FirstWrite -1}
		M_e_1 {Type I LastRead 1 FirstWrite -1}
		M_e_2 {Type I LastRead 1 FirstWrite -1}
		M_e_3 {Type I LastRead 1 FirstWrite -1}}
	compute_pp_nn_Pipeline_VITIS_LOOP_104_1 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln106 {Type I LastRead 0 FirstWrite -1}
		mul_ln108 {Type I LastRead 0 FirstWrite -1}
		pp_write_assign_out {Type O LastRead -1 FirstWrite 1}
		nn_write_assign_out {Type O LastRead -1 FirstWrite 1}
		M_e_0 {Type I LastRead 1 FirstWrite -1}
		M_e_1 {Type I LastRead 1 FirstWrite -1}
		M_e_2 {Type I LastRead 1 FirstWrite -1}
		M_e_3 {Type I LastRead 1 FirstWrite -1}}
	compute_greedy_potential_score {
		r1 {Type I LastRead 0 FirstWrite -1}
		r2 {Type I LastRead 0 FirstWrite -1}
		sign {Type I LastRead 1 FirstWrite -1}
		k1 {Type I LastRead 2 FirstWrite -1}
		k2 {Type I LastRead 2 FirstWrite -1}
		M_cols {Type I LastRead 9 FirstWrite -1}
		M_e_0 {Type IO LastRead 1 FirstWrite -1}
		M_e_1 {Type IO LastRead 1 FirstWrite -1}
		M_e_2 {Type IO LastRead 1 FirstWrite -1}
		M_e_3 {Type IO LastRead 1 FirstWrite -1}
		M_t {Type IO LastRead 3 FirstWrite 18}
		M_t_capacity {Type I LastRead 3 FirstWrite -1}
		M_rows {Type I LastRead 3 FirstWrite -1}}
	compute_pp_nn {
		r1 {Type I LastRead 0 FirstWrite -1}
		r2 {Type I LastRead 0 FirstWrite -1}
		M_cols {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type I LastRead 1 FirstWrite -1}
		M_e_1 {Type I LastRead 1 FirstWrite -1}
		M_e_2 {Type I LastRead 1 FirstWrite -1}
		M_e_3 {Type I LastRead 1 FirstWrite -1}}
	compute_pp_nn_Pipeline_VITIS_LOOP_104_1 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln106 {Type I LastRead 0 FirstWrite -1}
		mul_ln108 {Type I LastRead 0 FirstWrite -1}
		pp_write_assign_out {Type O LastRead -1 FirstWrite 1}
		nn_write_assign_out {Type O LastRead -1 FirstWrite 1}
		M_e_0 {Type I LastRead 1 FirstWrite -1}
		M_e_1 {Type I LastRead 1 FirstWrite -1}
		M_e_2 {Type I LastRead 1 FirstWrite -1}
		M_e_3 {Type I LastRead 1 FirstWrite -1}}
	compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1 {
		new_col {Type I LastRead 0 FirstWrite -1}
		mul_ln121 {Type I LastRead 0 FirstWrite -1}
		mul_ln122 {Type I LastRead 0 FirstWrite -1}
		mul_ln133 {Type I LastRead 0 FirstWrite -1}
		icmp_ln196 {Type I LastRead 0 FirstWrite -1}
		cmp34_i {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type IO LastRead 1 FirstWrite 3}
		M_e_1 {Type IO LastRead 1 FirstWrite 3}
		M_e_2 {Type IO LastRead 1 FirstWrite 3}
		M_e_3 {Type IO LastRead 1 FirstWrite 3}}
	compute_greedy_potential_score_Pipeline_VITIS_LOOP_146_1 {
		rowt {Type I LastRead 0 FirstWrite -1}
		zext_ln144 {Type I LastRead 0 FirstWrite -1}
		add_ln144 {Type I LastRead 0 FirstWrite -1}
		row1_ce_out {Type O LastRead -1 FirstWrite 1}
		M_e_0 {Type I LastRead 0 FirstWrite -1}
		M_e_1 {Type I LastRead 0 FirstWrite -1}
		M_e_2 {Type I LastRead 0 FirstWrite -1}
		M_e_3 {Type I LastRead 0 FirstWrite -1}}
	compute_greedy_potential_score_Pipeline_VITIS_LOOP_152_2 {
		zext_ln152 {Type I LastRead 0 FirstWrite -1}
		zext_ln144 {Type I LastRead 0 FirstWrite -1}
		add_ln144 {Type I LastRead 0 FirstWrite -1}
		sext_ln152 {Type I LastRead 0 FirstWrite -1}
		move_type_1_out {Type O LastRead -1 FirstWrite 1}
		row2_1_out {Type O LastRead -1 FirstWrite 1}
		M_e_0 {Type I LastRead 0 FirstWrite -1}
		M_e_1 {Type I LastRead 0 FirstWrite -1}
		M_e_2 {Type I LastRead 0 FirstWrite -1}
		M_e_3 {Type I LastRead 0 FirstWrite -1}}
	compute_greedy_potential_score_Pipeline_VITIS_LOOP_163_3 {
		move_type_2 {Type I LastRead 0 FirstWrite -1}
		colt {Type I LastRead 0 FirstWrite -1}
		mul_ln165 {Type I LastRead 0 FirstWrite -1}
		mul_ln161 {Type I LastRead 0 FirstWrite -1}
		mul_ln162 {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type IO LastRead 0 FirstWrite 1}
		M_e_1 {Type IO LastRead 0 FirstWrite 1}
		M_e_2 {Type IO LastRead 0 FirstWrite 1}
		M_e_3 {Type IO LastRead 0 FirstWrite 1}}
	greedy_potential_reduce_Pipeline_VITIS_LOOP_124_1 {
		new_col {Type I LastRead 0 FirstWrite -1}
		mul_ln121 {Type I LastRead 0 FirstWrite -1}
		mul_ln122 {Type I LastRead 0 FirstWrite -1}
		mul_ln133 {Type I LastRead 0 FirstWrite -1}
		icmp_ln122 {Type I LastRead 0 FirstWrite -1}
		cmp34_i {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type IO LastRead 1 FirstWrite 3}
		M_e_1 {Type IO LastRead 1 FirstWrite 3}
		M_e_2 {Type IO LastRead 1 FirstWrite 3}
		M_e_3 {Type IO LastRead 1 FirstWrite 3}}
	store_matrix_to_dram {
		A_dram {Type O LastRead -1 FirstWrite 4}
		M_rows {Type I LastRead 0 FirstWrite -1}
		M_cols {Type I LastRead 0 FirstWrite -1}
		M_e_0 {Type I LastRead 3 FirstWrite -1}
		M_e_1 {Type I LastRead 3 FirstWrite -1}
		M_e_2 {Type I LastRead 3 FirstWrite -1}
		M_e_3 {Type I LastRead 3 FirstWrite -1}}
	store_matrix_to_dram_Pipeline_VITIS_LOOP_68_1_VITIS_LOOP_69_2 {
		cols {Type I LastRead 0 FirstWrite -1}
		bound {Type I LastRead 0 FirstWrite -1}
		A_dram {Type O LastRead -1 FirstWrite 4}
		M_e_0 {Type I LastRead 3 FirstWrite -1}
		M_e_1 {Type I LastRead 3 FirstWrite -1}
		M_e_2 {Type I LastRead 3 FirstWrite -1}
		M_e_3 {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A_dram { ap_none {  { A_dram_i in_data 0 32 }  { A_dram_o out_data 1 32 } } }
	rows { ap_none {  { rows in_data 0 32 } } }
	cols { ap_none {  { cols in_data 0 32 } } }
	t_capacity { ap_none {  { t_capacity in_data 0 32 } } }
	k1 { ap_none {  { k1 in_data 0 32 } } }
	k2 { ap_none {  { k2 in_data 0 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
