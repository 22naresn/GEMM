// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfmm_reduce_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFmm_reduce_kernel_CfgInitialize(XFmm_reduce_kernel *InstancePtr, XFmm_reduce_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->Control_r_BaseAddress = ConfigPtr->Control_r_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFmm_reduce_kernel_Start(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFmm_reduce_kernel_IsDone(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFmm_reduce_kernel_IsIdle(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFmm_reduce_kernel_IsReady(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFmm_reduce_kernel_EnableAutoRestart(XFmm_reduce_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFmm_reduce_kernel_DisableAutoRestart(XFmm_reduce_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XFmm_reduce_kernel_Set_rows(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_ROWS_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_rows(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_ROWS_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_cols(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_COLS_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_cols(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_COLS_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_t_capacity(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_T_CAPACITY_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_t_capacity(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_T_CAPACITY_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_k1(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_K1_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_k1(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_K1_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_k2(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_K2_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_k2(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_K2_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_verbose(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_VERBOSE_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_verbose(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_VERBOSE_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_debug_capacity(XFmm_reduce_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_DEBUG_CAPACITY_DATA, Data);
}

u32 XFmm_reduce_kernel_Get_debug_capacity(XFmm_reduce_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_DEBUG_CAPACITY_DATA);
    return Data;
}

void XFmm_reduce_kernel_Set_A_dram(XFmm_reduce_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_A_DRAM_DATA, (u32)(Data));
    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_A_DRAM_DATA + 4, (u32)(Data >> 32));
}

u64 XFmm_reduce_kernel_Get_A_dram(XFmm_reduce_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_A_DRAM_DATA);
    Data += (u64)XFmm_reduce_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_A_DRAM_DATA + 4) << 32;
    return Data;
}

void XFmm_reduce_kernel_Set_debug_dram(XFmm_reduce_kernel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_DEBUG_DRAM_DATA, (u32)(Data));
    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_DEBUG_DRAM_DATA + 4, (u32)(Data >> 32));
}

u64 XFmm_reduce_kernel_Get_debug_dram(XFmm_reduce_kernel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFmm_reduce_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_DEBUG_DRAM_DATA);
    Data += (u64)XFmm_reduce_kernel_ReadReg(InstancePtr->Control_r_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_R_ADDR_DEBUG_DRAM_DATA + 4) << 32;
    return Data;
}

void XFmm_reduce_kernel_InterruptGlobalEnable(XFmm_reduce_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XFmm_reduce_kernel_InterruptGlobalDisable(XFmm_reduce_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XFmm_reduce_kernel_InterruptEnable(XFmm_reduce_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_IER);
    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XFmm_reduce_kernel_InterruptDisable(XFmm_reduce_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_IER);
    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFmm_reduce_kernel_InterruptClear(XFmm_reduce_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFmm_reduce_kernel_WriteReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XFmm_reduce_kernel_InterruptGetEnabled(XFmm_reduce_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_IER);
}

u32 XFmm_reduce_kernel_InterruptGetStatus(XFmm_reduce_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFmm_reduce_kernel_ReadReg(InstancePtr->Control_BaseAddress, XFMM_REDUCE_KERNEL_CONTROL_ADDR_ISR);
}

