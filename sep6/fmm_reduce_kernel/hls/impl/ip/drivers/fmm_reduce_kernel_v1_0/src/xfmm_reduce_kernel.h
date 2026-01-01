// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.1 (64-bit)
// Tool Version Limit: 2025.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFMM_REDUCE_KERNEL_H
#define XFMM_REDUCE_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfmm_reduce_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
} XFmm_reduce_kernel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u64 Control_r_BaseAddress;
    u32 IsReady;
} XFmm_reduce_kernel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFmm_reduce_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFmm_reduce_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFmm_reduce_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFmm_reduce_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XFmm_reduce_kernel_Initialize(XFmm_reduce_kernel *InstancePtr, UINTPTR BaseAddress);
XFmm_reduce_kernel_Config* XFmm_reduce_kernel_LookupConfig(UINTPTR BaseAddress);
#else
int XFmm_reduce_kernel_Initialize(XFmm_reduce_kernel *InstancePtr, u16 DeviceId);
XFmm_reduce_kernel_Config* XFmm_reduce_kernel_LookupConfig(u16 DeviceId);
#endif
int XFmm_reduce_kernel_CfgInitialize(XFmm_reduce_kernel *InstancePtr, XFmm_reduce_kernel_Config *ConfigPtr);
#else
int XFmm_reduce_kernel_Initialize(XFmm_reduce_kernel *InstancePtr, const char* InstanceName);
int XFmm_reduce_kernel_Release(XFmm_reduce_kernel *InstancePtr);
#endif

void XFmm_reduce_kernel_Start(XFmm_reduce_kernel *InstancePtr);
u32 XFmm_reduce_kernel_IsDone(XFmm_reduce_kernel *InstancePtr);
u32 XFmm_reduce_kernel_IsIdle(XFmm_reduce_kernel *InstancePtr);
u32 XFmm_reduce_kernel_IsReady(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_EnableAutoRestart(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_DisableAutoRestart(XFmm_reduce_kernel *InstancePtr);

void XFmm_reduce_kernel_Set_rows(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_rows(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_cols(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_cols(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_t_capacity(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_t_capacity(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_k1(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_k1(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_k2(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_k2(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_verbose(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_verbose(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_debug_capacity(XFmm_reduce_kernel *InstancePtr, u32 Data);
u32 XFmm_reduce_kernel_Get_debug_capacity(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_A_dram(XFmm_reduce_kernel *InstancePtr, u64 Data);
u64 XFmm_reduce_kernel_Get_A_dram(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_Set_debug_dram(XFmm_reduce_kernel *InstancePtr, u64 Data);
u64 XFmm_reduce_kernel_Get_debug_dram(XFmm_reduce_kernel *InstancePtr);

void XFmm_reduce_kernel_InterruptGlobalEnable(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_InterruptGlobalDisable(XFmm_reduce_kernel *InstancePtr);
void XFmm_reduce_kernel_InterruptEnable(XFmm_reduce_kernel *InstancePtr, u32 Mask);
void XFmm_reduce_kernel_InterruptDisable(XFmm_reduce_kernel *InstancePtr, u32 Mask);
void XFmm_reduce_kernel_InterruptClear(XFmm_reduce_kernel *InstancePtr, u32 Mask);
u32 XFmm_reduce_kernel_InterruptGetEnabled(XFmm_reduce_kernel *InstancePtr);
u32 XFmm_reduce_kernel_InterruptGetStatus(XFmm_reduce_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
