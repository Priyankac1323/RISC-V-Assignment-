 32-bit 5-Stage Pipelined RISC-V Processor using SystemVerilog

## Project Description

This project focuses on the design and implementation of a 32-bit Single-Cycle RISC-V Processor using SystemVerilog.

The processor is designed to execute instructions based on the RISC-V instruction set architecture. Each instruction is processed through different stages, including instruction fetch, decode, execution, memory access and write-back, within a single clock cycle.

The main aim of this project is to understand computer architecture, processor datapath design and digital hardware implementation.

## Main Features

- 32-bit processor architecture
- Single-cycle datapath
- Arithmetic and logical operations
- Register-based operations
- Instruction and data memory
- Branching and jump operations
- Control unit for instruction decoding

## Supported Instructions

| Instruction | Description |
|---|---|
| ADD | Addition |
| SUB | Subtraction |
| AND | Bitwise AND |
| OR | Bitwise OR |
| XOR | Bitwise XOR |
| SLT | Set Less Than |
| ADDI | Add Immediate |
| LW | Load Word |
| SW | Store Word |
| BEQ | Branch if Equal |
| JAL | Jump and Link |

## Project Modules

| Module | Function |
|---|---|
| adder.sv | Performs 32-bit addition |
| alu.sv | Performs arithmetic and logical operations |
| aludec.sv | Generates ALU control signals |
| controller.sv | Controls processor operations |
| datapath.sv | Connects processor datapath components |
| dmem.sv | Stores and retrieves data |
| extend.sv | Extends immediate values |
| flopr.sv | Resettable register |
| flopenr.sv | Enabled resettable register |
| imem.sv | Stores instructions |
| maindec.sv | Decodes instructions |
| mux2.sv | 2-to-1 multiplexer |
| mux3.sv | 3-to-1 multiplexer |
| pc.sv | Program counter |
| regfile.sv | Register file |
| riscv.sv | Top-level processor module |
| tb_riscv_cpu.sv | Processor testbench |

## Tools and Technologies

- SystemVerilog
- Xilinx Vivado
- GitHub

## Working Principle

The processor follows a single-cycle architecture.

1. **Instruction Fetch:** The processor fetches an instruction from instruction memory using the Program Counter.
2. **Instruction Decode:** The control unit decodes the instruction and generates control signals.
3. **Execution:** The ALU performs the required arithmetic or logical operation.
4. **Memory Access:** Data memory is accessed for load and store instructions.
5. **Write Back:** The result is written into the register file.

## Future Work

- Complete integration of all processor modules.
- Perform functional verification using a testbench.
- Simulate instruction execution.
- Analyze simulation waveforms.
- Improve and optimize the processor design.

## Project Status

RTL design and module development are in progress. Simulation and functional verification are planned as the next steps.

## Author
