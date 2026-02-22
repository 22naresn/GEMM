set moduleName load_matrix_from_dram
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
set C_modelName {load_matrix_from_dram}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict M_e_0 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_1 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_2 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict M_e_3 { MEM_WIDTH 32 MEM_SIZE 102400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ A_dram_read int 32 regular  }
	{ rows int 32 regular  }
	{ cols int 32 regular  }
	{ t_capacity int 32 regular  }
	{ M_rows int 32 regular {pointer 1} {global 1}  }
	{ M_cols int 32 regular {pointer 1} {global 1}  }
	{ M_t int 32 regular {pointer 1} {global 1}  }
	{ M_t_capacity int 32 regular {pointer 1} {global 1}  }
	{ M_e_0 int 32 regular {array 25600 { 0 } 0 1 } {global 1}  }
	{ M_e_1 int 32 regular {array 25600 { 0 } 0 1 } {global 1}  }
	{ M_e_2 int 32 regular {array 25600 { 0 } 0 1 } {global 1}  }
	{ M_e_3 int 32 regular {array 25600 { 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "A_dram_read", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rows", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "cols", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "t_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "M_rows", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_cols", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_t", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_t_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_e_0", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_e_1", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_e_2", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "M_e_3", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ A_dram_read sc_in sc_lv 32 signal 0 } 
	{ rows sc_in sc_lv 32 signal 1 } 
	{ cols sc_in sc_lv 32 signal 2 } 
	{ t_capacity sc_in sc_lv 32 signal 3 } 
	{ M_rows sc_out sc_lv 32 signal 4 } 
	{ M_rows_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ M_cols sc_out sc_lv 32 signal 5 } 
	{ M_cols_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ M_t sc_out sc_lv 32 signal 6 } 
	{ M_t_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ M_t_capacity sc_out sc_lv 32 signal 7 } 
	{ M_t_capacity_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ M_e_0_address0 sc_out sc_lv 15 signal 8 } 
	{ M_e_0_ce0 sc_out sc_logic 1 signal 8 } 
	{ M_e_0_we0 sc_out sc_logic 1 signal 8 } 
	{ M_e_0_d0 sc_out sc_lv 32 signal 8 } 
	{ M_e_1_address0 sc_out sc_lv 15 signal 9 } 
	{ M_e_1_ce0 sc_out sc_logic 1 signal 9 } 
	{ M_e_1_we0 sc_out sc_logic 1 signal 9 } 
	{ M_e_1_d0 sc_out sc_lv 32 signal 9 } 
	{ M_e_2_address0 sc_out sc_lv 15 signal 10 } 
	{ M_e_2_ce0 sc_out sc_logic 1 signal 10 } 
	{ M_e_2_we0 sc_out sc_logic 1 signal 10 } 
	{ M_e_2_d0 sc_out sc_lv 32 signal 10 } 
	{ M_e_3_address0 sc_out sc_lv 15 signal 11 } 
	{ M_e_3_ce0 sc_out sc_logic 1 signal 11 } 
	{ M_e_3_we0 sc_out sc_logic 1 signal 11 } 
	{ M_e_3_d0 sc_out sc_lv 32 signal 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "A_dram_read", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A_dram_read", "role": "default" }} , 
 	{ "name": "rows", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "default" }} , 
 	{ "name": "cols", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "default" }} , 
 	{ "name": "t_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "t_capacity", "role": "default" }} , 
 	{ "name": "M_rows", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_rows", "role": "default" }} , 
 	{ "name": "M_rows_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_rows", "role": "ap_vld" }} , 
 	{ "name": "M_cols", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_cols", "role": "default" }} , 
 	{ "name": "M_cols_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_cols", "role": "ap_vld" }} , 
 	{ "name": "M_t", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t", "role": "default" }} , 
 	{ "name": "M_t_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_t", "role": "ap_vld" }} , 
 	{ "name": "M_t_capacity", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_t_capacity", "role": "default" }} , 
 	{ "name": "M_t_capacity_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "M_t_capacity", "role": "ap_vld" }} , 
 	{ "name": "M_e_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_0", "role": "address0" }} , 
 	{ "name": "M_e_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_0", "role": "ce0" }} , 
 	{ "name": "M_e_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_0", "role": "we0" }} , 
 	{ "name": "M_e_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_0", "role": "d0" }} , 
 	{ "name": "M_e_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_1", "role": "address0" }} , 
 	{ "name": "M_e_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_1", "role": "ce0" }} , 
 	{ "name": "M_e_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_1", "role": "we0" }} , 
 	{ "name": "M_e_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_1", "role": "d0" }} , 
 	{ "name": "M_e_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_2", "role": "address0" }} , 
 	{ "name": "M_e_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_2", "role": "ce0" }} , 
 	{ "name": "M_e_2_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_2", "role": "we0" }} , 
 	{ "name": "M_e_2_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_2", "role": "d0" }} , 
 	{ "name": "M_e_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":15, "type": "signal", "bundle":{"name": "M_e_3", "role": "address0" }} , 
 	{ "name": "M_e_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_3", "role": "ce0" }} , 
 	{ "name": "M_e_3_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "M_e_3", "role": "we0" }} , 
 	{ "name": "M_e_3_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "M_e_3", "role": "d0" }}  ]}

set ArgLastReadFirstWriteLatency {
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
		M_e_3 {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	A_dram_read { ap_none {  { A_dram_read in_data 0 32 } } }
	rows { ap_none {  { rows in_data 0 32 } } }
	cols { ap_none {  { cols in_data 0 32 } } }
	t_capacity { ap_none {  { t_capacity in_data 0 32 } } }
	M_rows { ap_vld {  { M_rows out_data 1 32 }  { M_rows_ap_vld out_vld 1 1 } } }
	M_cols { ap_vld {  { M_cols out_data 1 32 }  { M_cols_ap_vld out_vld 1 1 } } }
	M_t { ap_vld {  { M_t out_data 1 32 }  { M_t_ap_vld out_vld 1 1 } } }
	M_t_capacity { ap_vld {  { M_t_capacity out_data 1 32 }  { M_t_capacity_ap_vld out_vld 1 1 } } }
	M_e_0 { ap_memory {  { M_e_0_address0 mem_address 1 15 }  { M_e_0_ce0 mem_ce 1 1 }  { M_e_0_we0 mem_we 1 1 }  { M_e_0_d0 mem_din 1 32 } } }
	M_e_1 { ap_memory {  { M_e_1_address0 mem_address 1 15 }  { M_e_1_ce0 mem_ce 1 1 }  { M_e_1_we0 mem_we 1 1 }  { M_e_1_d0 mem_din 1 32 } } }
	M_e_2 { ap_memory {  { M_e_2_address0 mem_address 1 15 }  { M_e_2_ce0 mem_ce 1 1 }  { M_e_2_we0 mem_we 1 1 }  { M_e_2_d0 mem_din 1 32 } } }
	M_e_3 { ap_memory {  { M_e_3_address0 mem_address 1 15 }  { M_e_3_ce0 mem_ce 1 1 }  { M_e_3_we0 mem_we 1 1 }  { M_e_3_d0 mem_din 1 32 } } }
}
