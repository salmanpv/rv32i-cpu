# rv32i-cpu

# RV32I Processor (32-bit RISC-V CPU in Verilog)

This is a step-by-step implementation of a **single-cycle RV32I processor**, starting from scratch after completing a custom 8-bit CPU. The project follows the official RISC-V base integer instruction set (RV32I), using Verilog HDL.

---

## 📁 Project Structure

rv32i-cpu/
├── README.md
├── docs/ # Diagrams and architecture notes
├── src/ # Verilog source files
├── testbench/ # Testbenches
├── programs/ # RISC-V assembly + compiled hex
├── Makefile # (Optional) build automation
└── .gitignore


---

## ✅ Goals
- Build a **32-bit CPU** implementing RV32I base instructions
- Learn standard ISA design: register file, ALU, control, memory
- Simulate and test RISC-V assembly programs

---

## ⌛ Progress Tracker
| Component       | Status       |
|----------------|--------------|
| ISA Study       | ✅ Completed  |
| Register File   | 🚧 In Progress |
| ALU             | ⬜ Not Started |
| Control Unit    | ⬜ Not Started |
| Datapath        | ⬜ Not Started |
| Testing         | ⬜ Not Started |

---

## 🛠 Tools
- Verilog (Icarus Verilog / ModelSim)
- GTKWave (waveform viewer)
- RISC-V tools (assembler or compiler)
- Git + GitHub for version tracking

---

## 📚 Reference
- [RISC-V Green Card](https://inst.eecs.berkeley.edu/~cs61c/fa17/img/riscvcard.pdf)
- [RISC-V User ISA Manual](https://riscv.org/specifications/)
