// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of A_dram
//        bit 31~0 - A_dram[31:0] (Read/Write)
// 0x14 : Data signal of A_dram
//        bit 31~0 - A_dram[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of debug_dram
//        bit 31~0 - debug_dram[31:0] (Read/Write)
// 0x20 : Data signal of debug_dram
//        bit 31~0 - debug_dram[63:32] (Read/Write)
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_R_ADDR_A_DRAM_DATA     0x10
#define CONTROL_R_BITS_A_DRAM_DATA     64
#define CONTROL_R_ADDR_DEBUG_DRAM_DATA 0x1c
#define CONTROL_R_BITS_DEBUG_DRAM_DATA 64
