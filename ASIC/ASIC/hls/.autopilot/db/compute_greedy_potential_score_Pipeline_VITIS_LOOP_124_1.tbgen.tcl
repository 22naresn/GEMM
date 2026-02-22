set moduleName compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set isPipelined_legacy 1
set pipeline_type loop_auto_rewind
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
set C_modelName {compute_greedy_potential_score_Pipeline_VITIS_LOOP_124_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e_0 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict M_e_1 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict M_e_2 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict M_e_3 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ new_col int 32 regular  }
	{ mul_ln121 int 15 regular  }
	{ mul_ln122 int 15 regular  }
	{ mul_ln133 int 15 regular  }
	{ icmp_ln196 int 1 regular  }
	{ cmp34_i int 1 regular  }
	{ M_e_0 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_e_1 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_e_2 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
	{ M_e_3 int 32 regular {array 25600 { 2 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "new_col", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln121", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln122", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln133", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "icmp_ln196", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cmp34_i", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "M_e_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_e_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_e_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "M_e_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ new_col sc_in sc_lv 32 signal 0 } 
	{ mul_ln121 sc_in sc_lv 15 signal 1 } 
	{ mul_ln122 sc_in sc_lv 15 signal 2 } 
	{ mul_ln133 sc_in sc_lv 15 signal 3 } 
	{ icmp_ln196 sc_in sc_lv 1 signal 4 } 
	{ cmp34_i sc_in sc_lv 1 signal 5 } 
	{ M_e_0_address0 sc_out sc_lv 15 signal 6 } 
	{ M_e_0_ce0 sc_out sc_logic 1 signal 6 } 
	{ M_e_0_we0 sc_out sc_logic 1 signal 6 } 
	{ M_e_0_d0 sc_out sc_lv 32 signal 6 } 
	{ M_e_0_q0 sc_in sc_lv 32 signal 6 } 
	{ M_e_1_address0 sc_out sc_lv 15 signal 7 } 
	{ M_e_1_ce0 sc_out sc_logic 1 signal 7 } 
	{ M_e_1_we0 sc_out sc_logic 1 signal 7 } 
	{ M_e_1_d0 sc_out sc_lv 32 signal 7 } 
	{ M_e_1_q0 sc_in sc_lv 32 signal 7 } 
	{ M_e_2_address0 sc_out sc_lv 15 signal 8 } 
	{ M_e_2_ce0 sc_out sc_logic 1 signal 8 } 
	{ M_e_2_we0 sc_out sc_logic 1 signal 8 } 
	{ M_e_2_d0 sc_out sc_lv 32 signal 8 } 
	{ M_e_2_q0 sc_in sc_lv 32 signal 8 } 
	{ M_e_3_address0 sc_out sc_lv 15 signal 9 } 
	{ M_e_3_ce0 sc_out sc_logic 1 signal 9 } 
	{ M_e_3_we0 sc_out sc_logic 1 signal 9 } 
	{ M_e_3_d0 sc_out sc_lv 32 signal 9 } 
	{ M_e_3_q0 sc_in sc_lv 32 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "new_col", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "new_col", "role": "default" }} , 
 	{ "name": "mul_ln121", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln121", "role": "default" }} , 
 	{ "name": "mul_ln122", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln122", "role": "default" }} , 
 	{ "name": "mul_ln133", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln133", "role": "default" }} , 
 	{ "name": "icmp_ln196", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln196", "role": "default" }} , 
 	{ "name": "cmp34_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp34_i", "role": "default" }} , 
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
 	{ "name": "M_e_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_3", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		M_e_3 {Type IO LastRead 1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	new_col { ap_none {  { new_col in_data 0 32 } } }
	mul_ln121 { ap_none {  { mul_ln121 in_data 0 15 } } }
	mul_ln122 { ap_none {  { mul_ln122 in_data 0 15 } } }
	mul_ln133 { ap_none {  { mul_ln133 in_data 0 15 } } }
	icmp_ln196 { ap_none {  { icmp_ln196 in_data 0 1 } } }
	cmp34_i { ap_none {  { cmp34_i in_data 0 1 } } }
	M_e_0 { ap_memory {  { M_e_0_address0 mem_address 1 15 }  { M_e_0_ce0 mem_ce 1 1 }  { M_e_0_we0 mem_we 1 1 }  { M_e_0_d0 mem_din 1 32 }  { M_e_0_q0 mem_dout 0 32 } } }
	M_e_1 { ap_memory {  { M_e_1_address0 mem_address 1 15 }  { M_e_1_ce0 mem_ce 1 1 }  { M_e_1_we0 mem_we 1 1 }  { M_e_1_d0 mem_din 1 32 }  { M_e_1_q0 mem_dout 0 32 } } }
	M_e_2 { ap_memory {  { M_e_2_address0 mem_address 1 15 }  { M_e_2_ce0 mem_ce 1 1 }  { M_e_2_we0 mem_we 1 1 }  { M_e_2_d0 mem_din 1 32 }  { M_e_2_q0 mem_dout 0 32 } } }
	M_e_3 { ap_memory {  { M_e_3_address0 mem_address 1 15 }  { M_e_3_ce0 mem_ce 1 1 }  { M_e_3_we0 mem_we 1 1 }  { M_e_3_d0 mem_din 1 32 }  { M_e_3_q0 mem_dout 0 32 } } }
}
