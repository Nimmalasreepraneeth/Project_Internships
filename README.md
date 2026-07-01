# Internship Projects - FPGA & Verilog

A collection of 4 comprehensive FPGA projects developed during internship, showcasing digital circuit design and hardware implementation skills.

## 📋 Projects Overview

### 1. **ALU_4bit** - 4-Bit Arithmetic Logic Unit
   - **Location:** [`ALU_4bit/`](ALU_4bit/)
   - **Description:** Complete 4-bit ALU with 26 operations
   - **Features:**
     - Arithmetic: Add, Subtract, Multiply, Divide, Modulus
     - Logical: AND, OR, XOR, NOR, NAND
     - Comparison: Greater Than, Less Than, Equal
     - Shifts: Logical & Arithmetic shifts
     - Rotations: Left & Right rotations
     - Reductions: AND, OR, XOR reductions
   - **Files:** `src/ALU.v`, `src/ALU_tb.v`
   - **Status:** ✅ Simulated & Verified

### 2. **RAM** - Random Access Memory
   - **Location:** [`RAM/`](RAM/)
   - **Description:** Multi-port RAM implementation
   - **Features:**
     - Single-port RAM
     - Dual-port RAM
     - Read/Write operations
     - Memory verification
   - **Files:** `src/RAM_dual_port.v`, `src/RAM_single_port.v`, testbenches
   - **Status:** ✅ Simulated & Verified

### 3. **Binary Multiplier** - 4-bit x 4-bit Multiplier
   - **Location:** [`Binary_multiplier/`](Binary_multiplier/)
   - **Description:** Hardware multiplier for binary numbers
   - **Features:**
     - 4-bit x 4-bit multiplication
     - 8-bit output result
     - Optimized logic circuits
   - **Files:** `src/Binary_multiplier.v`, `src/Binary_multiplier_tb.v`
   - **Status:** ✅ Simulated & Verified

### 4. **FPGA RISC** - RISC Processor Implementation
   - **Location:** [`RISC_32bit/`](RISC_32bit/)
   - **Description:** 32-bit RISC processor on FPGA
   - **Features:**
     - RISC instruction set
     - ALU integration
     - Control unit
     - Memory interface
     - Datapath implementation
   - **Files:** `src/RISC_CPU.v`, `src/ALU.v`, `src/Controller.v`
   - **Status:** ✅ Simulated & Verified

---

## 📁 Project Structure
