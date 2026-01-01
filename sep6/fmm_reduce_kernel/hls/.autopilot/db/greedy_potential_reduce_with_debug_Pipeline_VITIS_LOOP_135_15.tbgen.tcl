set moduleName greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_135_15
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
set cdfgNum 28
set C_modelName {greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_135_15}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e { MEM_WIDTH 32 MEM_SIZE 409600 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ new_col_2 int 32 regular  }
	{ mul_ln117 int 17 regular  }
	{ M_e int 32 regular {array 102400 { 0 1 } 1 1 }  }
	{ mul_ln119274 int 17 regular  }
	{ mul_ln144_2 int 17 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "new_col_2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln117", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "M_e", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "mul_ln119274", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln144_2", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ new_col_2 sc_in sc_lv 32 signal 0 } 
	{ mul_ln117 sc_in sc_lv 17 signal 1 } 
	{ M_e_address0 sc_out sc_lv 17 signal 2 } 
	{ M_e_ce0 sc_out sc_logic 1 signal 2 } 
	{ M_e_we0 sc_out sc_logic 1 signal 2 } 
	{ M_e_d0 sc_out sc_lv 32 signal 2 } 
	{ M_e_address1 sc_out sc_lv 17 signal 2 } 
	{ M_e_ce1 sc_out sc_logic 1 signal 2 } 
	{ M_e_q1 sc_in sc_lv 32 signal 2 } 
	{ mul_ln119274 sc_in sc_lv 17 signal 3 } 
	{ mul_ln144_2 sc_in sc_lv 17 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "new_col_2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "new_col_2", "role": "default" }} , 
 	{ "name": "mul_ln117", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "mul_ln117", "role": "default" }} , 
 	{ "name": "M_e_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address0" }} , 
 	{ "name": "M_e_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce0" }} , 
 	{ "name": "M_e_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "we0" }} , 
 	{ "name": "M_e_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "d0" }} , 
 	{ "name": "M_e_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address1" }} , 
 	{ "name": "M_e_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce1" }} , 
 	{ "name": "M_e_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "q1" }} , 
 	{ "name": "mul_ln119274", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "mul_ln119274", "role": "default" }} , 
 	{ "name": "mul_ln144_2", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "mul_ln144_2", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_135_15 {
		new_col_2 {Type I LastRead 0 FirstWrite -1}
		mul_ln117 {Type I LastRead 0 FirstWrite -1}
		M_e {Type IO LastRead 1 FirstWrite 3}
		mul_ln119274 {Type I LastRead 0 FirstWrite -1}
		mul_ln144_2 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	new_col_2 { ap_none {  { new_col_2 in_data 0 32 } } }
	mul_ln117 { ap_none {  { mul_ln117 in_data 0 17 } } }
	M_e { ap_memory {  { M_e_address0 mem_address 1 17 }  { M_e_ce0 mem_ce 1 1 }  { M_e_we0 mem_we 1 1 }  { M_e_d0 mem_din 1 32 }  { M_e_address1 MemPortADDR2 1 17 }  { M_e_ce1 MemPortCE2 1 1 }  { M_e_q1 MemPortDOUT2 0 32 } } }
	mul_ln119274 { ap_none {  { mul_ln119274 in_data 0 17 } } }
	mul_ln144_2 { ap_none {  { mul_ln144_2 in_data 0 17 } } }
}
