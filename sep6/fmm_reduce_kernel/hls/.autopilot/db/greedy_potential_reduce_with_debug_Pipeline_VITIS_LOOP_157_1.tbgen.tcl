set moduleName greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_1
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
set C_modelName {greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e { MEM_WIDTH 32 MEM_SIZE 409600 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ rowt int 32 regular  }
	{ idxprom4_i12_i332_i_i int 17 regular  }
	{ M_e int 32 regular {array 102400 { 1 3 } 1 1 }  }
	{ row1_ce_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "rowt", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "idxprom4_i12_i332_i_i", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "M_e", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "row1_ce_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rowt sc_in sc_lv 32 signal 0 } 
	{ idxprom4_i12_i332_i_i sc_in sc_lv 17 signal 1 } 
	{ M_e_address0 sc_out sc_lv 17 signal 2 } 
	{ M_e_ce0 sc_out sc_logic 1 signal 2 } 
	{ M_e_q0 sc_in sc_lv 32 signal 2 } 
	{ row1_ce_out sc_out sc_lv 32 signal 3 } 
	{ row1_ce_out_ap_vld sc_out sc_logic 1 outvld 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rowt", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rowt", "role": "default" }} , 
 	{ "name": "idxprom4_i12_i332_i_i", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "idxprom4_i12_i332_i_i", "role": "default" }} , 
 	{ "name": "M_e_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "M_e", "role": "address0" }} , 
 	{ "name": "M_e_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e", "role": "ce0" }} , 
 	{ "name": "M_e_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e", "role": "q0" }} , 
 	{ "name": "row1_ce_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "row1_ce_out", "role": "default" }} , 
 	{ "name": "row1_ce_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "row1_ce_out", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	greedy_potential_reduce_with_debug_Pipeline_VITIS_LOOP_157_1 {
		rowt {Type I LastRead 0 FirstWrite -1}
		idxprom4_i12_i332_i_i {Type I LastRead 0 FirstWrite -1}
		M_e {Type I LastRead 0 FirstWrite -1}
		row1_ce_out {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	rowt { ap_none {  { rowt in_data 0 32 } } }
	idxprom4_i12_i332_i_i { ap_none {  { idxprom4_i12_i332_i_i in_data 0 17 } } }
	M_e { ap_memory {  { M_e_address0 mem_address 1 17 }  { M_e_ce0 mem_ce 1 1 }  { M_e_q0 mem_dout 0 32 } } }
	row1_ce_out { ap_vld {  { row1_ce_out out_data 1 32 }  { row1_ce_out_ap_vld out_vld 1 1 } } }
}
