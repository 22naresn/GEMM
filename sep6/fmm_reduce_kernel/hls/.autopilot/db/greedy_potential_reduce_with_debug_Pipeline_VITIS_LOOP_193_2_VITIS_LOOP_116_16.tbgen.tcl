set moduleName greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_16
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
set C_modelName {greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_16}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e { MEM_WIDTH 32 MEM_SIZE 409600 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ zext_ln193_3 int 31 regular  }
	{ s_11 int 32 regular  }
	{ cols_non_t int 32 regular  }
	{ mul_ln192_1 int 95 regular  }
	{ mul_ln118_2 int 17 regular  }
	{ M_e int 32 regular {array 102400 { 1 1 } 1 1 }  }
	{ s_16_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln193_3", "interface" : "wire", "bitwidth" : 31, "direction" : "READONLY"} , 
 	{ "Name" : "s_11", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cols_non_t", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln192_1", "interface" : "wire", "bitwidth" : 95, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln118_2", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "M_e", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "s_16_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln193_3 sc_in sc_lv 31 signal 0 } 
	{ s_11 sc_in sc_lv 32 signal 1 } 
	{ cols_non_t sc_in sc_lv 32 signal 2 } 
	{ mul_ln192_1 sc_in sc_lv 95 signal 3 } 
	{ mul_ln118_2 sc_in sc_lv 17 signal 4 } 
	{ M_e_address0 sc_out sc_lv 17 signal 5 } 
	{ M_e_ce0 sc_out sc_logic 1 signal 5 } 
	{ M_e_q0 sc_in sc_lv 32 signal 5 } 
	{ M_e_address1 sc_out sc_lv 17 signal 5 } 
	{ M_e_ce1 sc_out sc_logic 1 signal 5 } 
	{ M_e_q1 sc_in sc_lv 32 signal 5 } 
	{ s_16_out sc_out sc_lv 32 signal 6 } 
	{ s_16_out_ap_vld sc_out sc_logic 1 outvld 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln193_3", "direction": "in", "datatype": "sc_lv", "bitwidth":31, "type": "signal", "bundle":{"name": "zext_ln193_3", "role": "default" }} , 
 	{ "name": "s_11", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_11", "role": "default" }} , 
 	{ "name": "cols_non_t", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols_non_t", "role": "default" }} , 
 	{ "name": "mul_ln192_1", "direction": "in", "datatype": "sc_lv", "bitwidth":95, "type": "signal", "bundle":{"name": "mul_ln192_1", "role": "default" }} , 
 	{ "name": "mul_ln118_2", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "mul_ln118_2", "role": "default" }} , 
 	{ "name": "M_e_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address0" }} , 
 	{ "name": "M_e_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce0" }} , 
 	{ "name": "M_e_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "q0" }} , 
 	{ "name": "M_e_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address1" }} , 
 	{ "name": "M_e_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce1" }} , 
 	{ "name": "M_e_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "q1" }} , 
 	{ "name": "s_16_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "s_16_out", "role": "default" }} , 
 	{ "name": "s_16_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_16_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_193_2_VITIS_LOOP_116_16 {
		zext_ln193_3 {Type I LastRead 0 FirstWrite -1}
		s_11 {Type I LastRead 0 FirstWrite -1}
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln192_1 {Type I LastRead 0 FirstWrite -1}
		mul_ln118_2 {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 3 FirstWrite -1}
		s_16_out {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln193_3 { ap_none {  { zext_ln193_3 in_data 0 31 } } }
	s_11 { ap_none {  { s_11 in_data 0 32 } } }
	cols_non_t { ap_none {  { cols_non_t in_data 0 32 } } }
	mul_ln192_1 { ap_none {  { mul_ln192_1 in_data 0 95 } } }
	mul_ln118_2 { ap_none {  { mul_ln118_2 in_data 0 17 } } }
	M_e { ap_memory {  { M_e_address0 mem_address 1 17 }  { M_e_ce0 mem_ce 1 1 }  { M_e_q0 mem_dout 0 32 }  { M_e_address1 MemPortADDR2 1 17 }  { M_e_ce1 MemPortCE2 1 1 }  { M_e_q1 MemPortDOUT2 0 32 } } }
	s_16_out { ap_vld {  { s_16_out out_data 1 32 }  { s_16_out_ap_vld out_vld 1 1 } } }
}
