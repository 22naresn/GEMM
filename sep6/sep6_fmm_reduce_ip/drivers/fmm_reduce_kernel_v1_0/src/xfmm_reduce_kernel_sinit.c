// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xfmm_reduce_kernel.h"

extern XFmm_reduce_kernel_Config XFmm_reduce_kernel_ConfigTable[];

#ifdef SDT
XFmm_reduce_kernel_Config *XFmm_reduce_kernel_LookupConfig(UINTPTR BaseAddress) {
	XFmm_reduce_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XFmm_reduce_kernel_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XFmm_reduce_kernel_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XFmm_reduce_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFmm_reduce_kernel_Initialize(XFmm_reduce_kernel *InstancePtr, UINTPTR BaseAddress) {
	XFmm_reduce_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFmm_reduce_kernel_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFmm_reduce_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XFmm_reduce_kernel_Config *XFmm_reduce_kernel_LookupConfig(u16 DeviceId) {
	XFmm_reduce_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFMM_REDUCE_KERNEL_NUM_INSTANCES; Index++) {
		if (XFmm_reduce_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFmm_reduce_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFmm_reduce_kernel_Initialize(XFmm_reduce_kernel *InstancePtr, u16 DeviceId) {
	XFmm_reduce_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFmm_reduce_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFmm_reduce_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

