set moduleName compute_pp_nn_Pipeline_VITIS_LOOP_104_1
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
set C_modelName {compute_pp_nn_Pipeline_VITIS_LOOP_104_1}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e_0 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_1 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_2 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_3 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ cols_non_t int 32 regular  }
	{ mul_ln106 int 15 regular  }
	{ mul_ln108 int 15 regular  }
	{ pp_write_assign_out int 32 regular {pointer 1}  }
	{ nn_write_assign_out int 32 regular {pointer 1}  }
	{ M_e_0 int 32 regular {array 25600 { 1 } 1 1 } {global 0}  }
	{ M_e_1 int 32 regular {array 25600 { 1 } 1 1 } {global 0}  }
	{ M_e_2 int 32 regular {array 25600 { 1 } 1 1 } {global 0}  }
	{ M_e_3 int 32 regular {array 25600 { 1 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "cols_non_t", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln106", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "mul_ln108", "interface" : "wire", "bitwidth" : 15, "direction" : "READONLY"} , 
 	{ "Name" : "pp_write_assign_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "nn_write_assign_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "M_e_0", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_e_1", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_e_2", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "M_e_3", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cols_non_t sc_in sc_lv 32 signal 0 } 
	{ mul_ln106 sc_in sc_lv 15 signal 1 } 
	{ mul_ln108 sc_in sc_lv 15 signal 2 } 
	{ pp_write_assign_out sc_out sc_lv 32 signal 3 } 
	{ pp_write_assign_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ nn_write_assign_out sc_out sc_lv 32 signal 4 } 
	{ nn_write_assign_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ M_e_0_address0 sc_out sc_lv 15 signal 5 } 
	{ M_e_0_ce0 sc_out sc_logic 1 signal 5 } 
	{ M_e_0_q0 sc_in sc_lv 32 signal 5 } 
	{ M_e_1_address0 sc_out sc_lv 15 signal 6 } 
	{ M_e_1_ce0 sc_out sc_logic 1 signal 6 } 
	{ M_e_1_q0 sc_in sc_lv 32 signal 6 } 
	{ M_e_2_address0 sc_out sc_lv 15 signal 7 } 
	{ M_e_2_ce0 sc_out sc_logic 1 signal 7 } 
	{ M_e_2_q0 sc_in sc_lv 32 signal 7 } 
	{ M_e_3_address0 sc_out sc_lv 15 signal 8 } 
	{ M_e_3_ce0 sc_out sc_logic 1 signal 8 } 
	{ M_e_3_q0 sc_in sc_lv 32 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cols_non_t", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols_non_t", "role": "default" }} , 
 	{ "name": "mul_ln106", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln106", "role": "default" }} , 
 	{ "name": "mul_ln108", "direction": "in", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "mul_ln108", "role": "default" }} , 
 	{ "name": "pp_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pp_write_assign_out", "role": "default" }} , 
 	{ "name": "pp_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "pp_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "nn_write_assign_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "nn_write_assign_out", "role": "default" }} , 
 	{ "name": "nn_write_assign_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nn_write_assign_out", "role": "ap_vld" }} , 
 	{ "name": "M_e_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_0", "role": "address0" }} , 
 	{ "name": "M_e_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_0", "role": "ce0" }} , 
 	{ "name": "M_e_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_0", "role": "q0" }} , 
 	{ "name": "M_e_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_1", "role": "address0" }} , 
 	{ "name": "M_e_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_1", "role": "ce0" }} , 
 	{ "name": "M_e_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_1", "role": "q0" }} , 
 	{ "name": "M_e_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_2", "role": "address0" }} , 
 	{ "name": "M_e_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_2", "role": "ce0" }} , 
 	{ "name": "M_e_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_2", "role": "q0" }} , 
 	{ "name": "M_e_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_3", "role": "address0" }} , 
 	{ "name": "M_e_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_3", "role": "ce0" }} , 
 	{ "name": "M_e_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_3", "role": "q0" }}  ]}

set ArgLastReadFirstWriteLatency {
	compute_pp_nn_Pipeline_VITIS_LOOP_104_1 {
		cols_non_t {Type I LastRead 0 FirstWrite -1}
		mul_ln106 {Type I LastRead 0 FirstWrite -1}
		mul_ln108 {Type I LastRead 0 FirstWrite -1}
		pp_write_assign_out {Type O LastRead -1 FirstWrite 1}
		nn_write_assign_out {Type O LastRead -1 FirstWrite 1}
		M_e_0 {Type I LastRead 1 FirstWrite -1}
		M_e_1 {Type I LastRead 1 FirstWrite -1}
		M_e_2 {Type I LastRead 1 FirstWrite -1}
		M_e_3 {Type I LastRead 1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	cols_non_t { ap_none {  { cols_non_t in_data 0 32 } } }
	mul_ln106 { ap_none {  { mul_ln106 in_data 0 15 } } }
	mul_ln108 { ap_none {  { mul_ln108 in_data 0 15 } } }
	pp_write_assign_out { ap_vld {  { pp_write_assign_out out_data 1 32 }  { pp_write_assign_out_ap_vld out_vld 1 1 } } }
	nn_write_assign_out { ap_vld {  { nn_write_assign_out out_data 1 32 }  { nn_write_assign_out_ap_vld out_vld 1 1 } } }
	M_e_0 { ap_memory {  { M_e_0_address0 mem_address 1 15 }  { M_e_0_ce0 mem_ce 1 1 }  { M_e_0_q0 mem_dout 0 32 } } }
	M_e_1 { ap_memory {  { M_e_1_address0 mem_address 1 15 }  { M_e_1_ce0 mem_ce 1 1 }  { M_e_1_q0 mem_dout 0 32 } } }
	M_e_2 { ap_memory {  { M_e_2_address0 mem_address 1 15 }  { M_e_2_ce0 mem_ce 1 1 }  { M_e_2_q0 mem_dout 0 32 } } }
	M_e_3 { ap_memory {  { M_e_3_address0 mem_address 1 15 }  { M_e_3_ce0 mem_ce 1 1 }  { M_e_3_q0 mem_dout 0 32 } } }
}
