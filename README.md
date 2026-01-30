# GEMM — Reduction-Based Matrix Multiply

        C = A × B
        with lesser additions :)


This repository contains an implementation of a reduction-based
General Matrix Multiply (GEMM) kernel.

The kernel operates on a matrix representation used in fast matrix
multiplication algorithms, where pairs of rows may be combined to
reduce the total number of arithmetic additions.


------------------------------------------------------------
Overview
------------------------------------------------------------

The project implements a greedy reduction algorithm that iteratively
combines rows based on overlap and potential.

The focus is on:
- synthesizable control flow
- explicit memory bounds
- predictable behavior under HLS
- basic host-side debug visibility


------------------------------------------------------------
What “SEP” Means
------------------------------------------------------------

SEP = Stable Execution Pass

A SEP refers to a point where the design has largely stopped changing
and is suitable to be treated as a baseline.

Earlier passes included exploratory work such as partial kernels,
experimental heuristics, and evolving data layouts. Those versions
were not preserved.

SEP 6 is the first pass where the architecture, interfaces, and memory
layout were stable enough to keep.

All code in this repository lives under sep6/ for this reason.

------------------------------------------------------------
fmm_reduce_kernel/
------------------------------------------------------------

This directory contains the core reduction kernel written for HLS.

Characteristics include:
- static storage for large matrices
- compile-time MAX_* limits
- runtime bounds checks on DRAM accesses
- AXI depth pragmas sized to worst-case usage
- deterministic control flow


------------------------------------------------------------
sep6_fmm_reduce_ip/
------------------------------------------------------------

This directory wraps the kernel into an IP-style block intended for
integration into a larger FPGA or SoC design.

It contains top-level interfaces and integration logic.


------------------------------------------------------------
Kernel Notes
------------------------------------------------------------

A few implementation details that may be useful when reading the code:

- All matrix dimensions are bounded at compile time.
- Memory accesses are guarded at runtime.
- Invalid inputs result in early exit.
- Debug writes are optional and capacity-checked.
- reduction_move() and reduction_move_undo() are paired operations.


------------------------------------------------------------
Getting Started / Usage
------------------------------------------------------------

git clone https://github.com/22naresn/GEMM.git
cd GEMM/sep6

Simulation or synthesis can be done using a standard HLS toolchain.
Vitis HLS preferrably


------------------------------------------------------------
Status
------------------------------------------------------------

SEP 6 is a stable baseline.

Further development would build on this pass.


------------------------------------------------------------
License
------------------------------------------------------------

This project is released under the MIT License.
