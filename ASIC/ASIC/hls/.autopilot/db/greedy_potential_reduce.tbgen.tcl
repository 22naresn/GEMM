set moduleName greedy_potential_reduce
set isTopModule 0
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
set C_modelName {greedy_potential_reduce}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e_0 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_1 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_2 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_3 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ k1 int 32 regular  }
	{ k2 int 32 regular  }
	{ M_rows int 32 regular {pointer 0} {global 0}  }
	{ M_t int 32 regular {pointer 2} {global 2}  }
	{ M_cols int 32 regular {pointer 0} {global 0}  }
	{ M_e_0 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_e_1 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_e_2 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_e_3 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_t_capacity int 32 regular {pointer 0} {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "k1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "k2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "M_rows", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_t", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_cols", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_e_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_e_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_e_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_e_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_t_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ k1 sc_in sc_lv 32 signal 0 } 
	{ k2 sc_in sc_lv 32 signal 1 } 
	{ M_rows sc_in sc_lv 32 signal 2 } 
	{ M_t_i sc_in sc_lv 32 signal 3 } 
	{ M_t_o sc_out sc_lv 32 signal 3 } 
	{ M_t_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ M_cols sc_in sc_lv 32 signal 4 } 
	{ M_e_0_address0 sc_out sc_lv 15 signal 5 } 
	{ M_e_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ M_e_0_we0 sc_out sc_logic 1 signal 5 } 
	{ M_e_0_d0 sc_out sc_lv 32 signal 5 } 
	{ M_e_0_q0 sc_in sc_lv 32 signal 5 } 
	{ M_e_1_address0 sc_out sc_lv 15 signal 6 } 
	{ M_e_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ M_e_1_we0 sc_out sc_logic 1 signal 6 } 
	{ M_e_1_d0 sc_out sc_lv 32 signal 6 } 
	{ M_e_1_q0 sc_in sc_lv 32 signal 6 } 
	{ M_e_2_address0 sc_out sc_lv 15 signal 7 } 
	{ M_e_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ M_e_2_we0 sc_out sc_logic 1 signal 7 } 
	{ M_e_2_d0 sc_out sc_lv 32 signal 7 } 
	{ M_e_2_q0 sc_in sc_lv 32 signal 7 } 
	{ M_e_3_address0 sc_out sc_lv 15 signal 8 } 
	{ M_e_3_ce0 sc_out sc_logic 1 signal 8 } 
	{ M_e_3_we0 sc_out sc_logic 1 signal 8 } 
	{ M_e_3_d0 sc_out sc_lv 32 signal 8 } 
	{ M_e_3_q0 sc_in sc_lv 32 signal 8 } 
	{ M_t_capacity sc_in sc_lv 32 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "k1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k1", "role": "default" }} , 
 	{ "name": "k2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "k2", "role": "default" }} , 
 	{ "name": "M_rows", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_rows", "role": "default" }} , 
 	{ "name": "M_t_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t", "role": "i" }} , 
 	{ "name": "M_t_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t", "role": "o" }} , 
 	{ "name": "M_t_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_t", "role": "o_ap_vld" }} , 
 	{ "name": "M_cols", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_cols", "role": "default" }} , 
 	{ "name": "M_e_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_0", "role": "address0" }} , 
 	{ "name": "M_e_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_0", "role": "ce0" }} , 
 	{ "name": "M_e_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_0", "role": "we0" }} , 
 	{ "name": "M_e_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_0", "role": "d0" }} , 
 	{ "name": "M_e_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_0", "role": "q0" }} , 
 	{ "name": "M_e_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_1", "role": "address0" }} , 
 	{ "name": "M_e_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_1", "role": "ce0" }} , 
 	{ "name": "M_e_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_1", "role": "we0" }} , 
 	{ "name": "M_e_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_1", "role": "d0" }} , 
 	{ "name": "M_e_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_1", "role": "q0" }} , 
 	{ "name": "M_e_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_2", "role": "address0" }} , 
 	{ "name": "M_e_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_2", "role": "ce0" }} , 
 	{ "name": "M_e_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_2", "role": "we0" }} , 
 	{ "name": "M_e_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_2", "role": "d0" }} , 
 	{ "name": "M_e_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_2", "role": "q0" }} , 
 	{ "name": "M_e_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_3", "role": "address0" }} , 
 	{ "name": "M_e_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_3", "role": "ce0" }} , 
 	{ "name": "M_e_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_3", "role": "we0" }} , 
 	{ "name": "M_e_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_3", "role": "d0" }} , 
 	{ "name": "M_e_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_3", "role": "q0" }} , 
 	{ "name": "M_t_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t_capacity", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		M_e_3 {Type IO LastRead 1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	k1 { ap_none {  { k1 in_data 0 32 } } }
	k2 { ap_none {  { k2 in_data 0 32 } } }
	M_rows { ap_none {  { M_rows in_data 0 32 } } }
	M_t { ap_ovld {  { M_t_i in_data 0 32 }  { M_t_o out_data 1 32 }  { M_t_o_ap_vld out_vld 1 1 } } }
	M_cols { ap_none {  { M_cols in_data 0 32 } } }
	M_e_0 { ap_memory {  { M_e_0_address0 mem_address 1 15 }  { M_e_0_ce0 mem_ce 1 1 }  { M_e_0_we0 mem_we 1 1 }  { M_e_0_d0 mem_din 1 32 }  { M_e_0_q0 mem_dout 0 32 } } }
	M_e_1 { ap_memory {  { M_e_1_address0 mem_address 1 15 }  { M_e_1_ce0 mem_ce 1 1 }  { M_e_1_we0 mem_we 1 1 }  { M_e_1_d0 mem_din 1 32 }  { M_e_1_q0 mem_dout 0 32 } } }
	M_e_2 { ap_memory {  { M_e_2_address0 mem_address 1 15 }  { M_e_2_ce0 mem_ce 1 1 }  { M_e_2_we0 mem_we 1 1 }  { M_e_2_d0 mem_din 1 32 }  { M_e_2_q0 mem_dout 0 32 } } }
	M_e_3 { ap_memory {  { M_e_3_address0 mem_address 1 15 }  { M_e_3_ce0 mem_ce 1 1 }  { M_e_3_we0 mem_we 1 1 }  { M_e_3_d0 mem_din 1 32 }  { M_e_3_q0 mem_dout 0 32 } } }
	M_t_capacity { ap_none {  { M_t_capacity in_data 0 32 } } }
}
