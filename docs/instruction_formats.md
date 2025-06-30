# Step 1: RV32I Instruction Formats and Types

This document summarizes the 6 instruction formats used in the **RV32I (32-bit Integer)** base instruction set of RISC-V. All instructions are 32 bits wide but have different layouts depending on their type.

---

## 🧱 Common Instruction Fields

| Field    | Bits | Description                                    |
| -------- | ---- | ---------------------------------------------- |
| `opcode` | 7    | Operation code — defines the instruction class |
| `rd`     | 5    | Destination register                           |
| `rs1`    | 5    | Source register 1                              |
| `rs2`    | 5    | Source register 2                              |
| `funct3` | 3    | Helps distinguish similar instructions         |
| `funct7` | 7    | Further distinction for R-type instructions    |
| `imm`    | Var  | Immediate value (used in I, S, B, U, J types)  |

---

## 🔢 RV32I Instruction Types

| Type | Use Case                     | Example Instructions       |
| ---- | ---------------------------- | -------------------------- |
| R    | Register-Register Arithmetic | `add`, `sub`, `and`, `or`  |
| I    | Immediate Arithmetic / Loads | `addi`, `lw`, `jalr`       |
| S    | Store Instructions           | `sw`, `sb`, `sh`           |
| B    | Branch Instructions          | `beq`, `bne`, `blt`, `bge` |
| U    | Upper Immediate              | `lui`, `auipc`             |
| J    | Unconditional Jump           | `jal`                      |

---

## 🧹 Instruction Formats

### ✅ R-Type Format (e.g., `add x1, x2, x3`)

```
[ funct7 ][ rs2 ][ rs1 ][ funct3 ][ rd ][ opcode ]
   7        5      5        3       5      7
```

### ✅ I-Type Format (e.g., `addi x1, x2, 10`)

```
[ imm[11:0] ][ rs1 ][ funct3 ][ rd ][ opcode ]
     12         5       3        5      7
```

### ✅ S-Type Format (e.g., `sw x2, 8(x3)`)

```
[ imm[11:5] ][ rs2 ][ rs1 ][ funct3 ][ imm[4:0] ][ opcode ]
     7          5      5       3           5          7
```

### ✅ B-Type Format (e.g., `beq x1, x2, offset`)

```
[ imm[12|10:5] ][ rs2 ][ rs1 ][ funct3 ][ imm[4:1|11] ][ opcode ]
       7          5      5       3           5             7
```

### ✅ U-Type Format (e.g., `lui x1, 0x12345000`)

```
[ imm[31:12] ][ rd ][ opcode ]
     20         5      7
```

### ✅ J-Type Format (e.g., `jal x1, offset`)

```
[ imm[20|10:1|11|19:12] ][ rd ][ opcode ]
        20 bits            5       7
```

---

##  Notes

* The `x0` register is hardwired to zero in all RISC-V processors.
* Immediate fields are sign-extended as needed.
* Instruction decoding requires both the `opcode`, `funct3`, and sometimes `funct7`.

---

## ✅ Next Step

> Proceed to **Step 2: Register File Design** — implementing 32 general-purpose registers (32-bit), with `x0` always zero.
