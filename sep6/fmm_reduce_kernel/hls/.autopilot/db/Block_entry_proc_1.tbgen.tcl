set moduleName Block_entry_proc_1
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
set cdfgNum 28
set C_modelName {Block_entry_proc.1}
set C_modelType { int 2 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ cols int 32 regular  }
	{ rows int 32 regular  }
	{ debug_capacity int 32 regular  }
	{ rows_c int 32 regular {fifo 1}  }
	{ cols_c int 32 regular {fifo 1}  }
	{ debug_capacity_c int 32 regular {fifo 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "cols", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rows", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "debug_capacity", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "rows_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "cols_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "debug_capacity_c", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 2} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cols sc_in sc_lv 32 signal 0 } 
	{ rows sc_in sc_lv 32 signal 1 } 
	{ debug_capacity sc_in sc_lv 32 signal 2 } 
	{ rows_c_din sc_out sc_lv 32 signal 3 } 
	{ rows_c_full_n sc_in sc_logic 1 signal 3 } 
	{ rows_c_write sc_out sc_logic 1 signal 3 } 
	{ rows_c_num_data_valid sc_in sc_lv 3 signal 3 } 
	{ rows_c_fifo_cap sc_in sc_lv 3 signal 3 } 
	{ cols_c_din sc_out sc_lv 32 signal 4 } 
	{ cols_c_full_n sc_in sc_logic 1 signal 4 } 
	{ cols_c_write sc_out sc_logic 1 signal 4 } 
	{ cols_c_num_data_valid sc_in sc_lv 3 signal 4 } 
	{ cols_c_fifo_cap sc_in sc_lv 3 signal 4 } 
	{ debug_capacity_c_din sc_out sc_lv 32 signal 5 } 
	{ debug_capacity_c_full_n sc_in sc_logic 1 signal 5 } 
	{ debug_capacity_c_write sc_out sc_logic 1 signal 5 } 
	{ debug_capacity_c_num_data_valid sc_in sc_lv 3 signal 5 } 
	{ debug_capacity_c_fifo_cap sc_in sc_lv 3 signal 5 } 
	{ ap_return_0 sc_out sc_lv 1 signal -1 } 
	{ ap_return_1 sc_out sc_lv 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cols", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols", "role": "default" }} , 
 	{ "name": "rows", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows", "role": "default" }} , 
 	{ "name": "debug_capacity", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_capacity", "role": "default" }} , 
 	{ "name": "rows_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "rows_c", "role": "din" }} , 
 	{ "name": "rows_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows_c", "role": "full_n" }} , 
 	{ "name": "rows_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rows_c", "role": "write" }} , 
 	{ "name": "rows_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rows_c", "role": "num_data_valid" }} , 
 	{ "name": "rows_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "rows_c", "role": "fifo_cap" }} , 
 	{ "name": "cols_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "cols_c", "role": "din" }} , 
 	{ "name": "cols_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols_c", "role": "full_n" }} , 
 	{ "name": "cols_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "cols_c", "role": "write" }} , 
 	{ "name": "cols_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cols_c", "role": "num_data_valid" }} , 
 	{ "name": "cols_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "cols_c", "role": "fifo_cap" }} , 
 	{ "name": "debug_capacity_c_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "debug_capacity_c", "role": "din" }} , 
 	{ "name": "debug_capacity_c_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_capacity_c", "role": "full_n" }} , 
 	{ "name": "debug_capacity_c_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "debug_capacity_c", "role": "write" }} , 
 	{ "name": "debug_capacity_c_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_capacity_c", "role": "num_data_valid" }} , 
 	{ "name": "debug_capacity_c_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "debug_capacity_c", "role": "fifo_cap" }} , 
 	{ "name": "ap_return_0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_0", "role": "default" }} , 
 	{ "name": "ap_return_1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return_1", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	Block_entry_proc_1 {
		cols {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		debug_capacity {Type I LastRead 0 FirstWrite -1}
		rows_c {Type O LastRead -1 FirstWrite 0}
		cols_c {Type O LastRead -1 FirstWrite 0}
		debug_capacity_c {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cols { ap_none {  { cols in_data 0 32 } } }
	rows { ap_none {  { rows in_data 0 32 } } }
	debug_capacity { ap_none {  { debug_capacity in_data 0 32 } } }
	rows_c { ap_fifo {  { rows_c_din fifo_data_in 1 32 }  { rows_c_full_n fifo_status 0 1 }  { rows_c_write fifo_port_we 1 1 }  { rows_c_num_data_valid fifo_status_num_data_valid 0 3 }  { rows_c_fifo_cap fifo_update 0 3 } } }
	cols_c { ap_fifo {  { cols_c_din fifo_data_in 1 32 }  { cols_c_full_n fifo_status 0 1 }  { cols_c_write fifo_port_we 1 1 }  { cols_c_num_data_valid fifo_status_num_data_valid 0 3 }  { cols_c_fifo_cap fifo_update 0 3 } } }
	debug_capacity_c { ap_fifo {  { debug_capacity_c_din fifo_data_in 1 32 }  { debug_capacity_c_full_n fifo_status 0 1 }  { debug_capacity_c_write fifo_port_we 1 1 }  { debug_capacity_c_num_data_valid fifo_status_num_data_valid 0 3 }  { debug_capacity_c_fifo_cap fifo_update 0 3 } } }
}
