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
     - **Unsigned Multiplier:** Positive numbers only (0 to 15)
     - **Signed Multiplier:** Positive & negative numbers (-8 to +7)
     - 4-bit x 4-bit multiplication
     - 8-bit output result
     - Optimized logic circuits
   - **Unsigned Version:** `Unsigned_multiplier/Unsigned_multiplier.v`
   - **Signed Version:** `Signed_multiplier/Signed_multiplier.v`
   - **Status:** ✅ Unsigned Complete | ✅ Signed Complete

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

## 🔍 Binary Multiplier - Unsigned vs Signed

### **Unsigned Multiplier**
- Multiplies **positive numbers only**
- Example: 5 × 3 = 15 ✅
- Range: 0 to 15 (for 4-bit)

### **Signed Multiplier**
- Multiplies **positive AND negative numbers**
- Uses 2's complement for negative numbers
- Example: (-5) × 3 = -15 ✅
- Example: (-5) × (-3) = 15 ✅
- Range: -8 to +7 (for 4-bit)

| Feature | Unsigned | Signed |
|---------|----------|--------|
| Positive numbers | ✅ | ✅ |
| Negative numbers | ❌ | ✅ |
| Use cases | Graphics, basic math | DSP, sensors, signals |

---

## 📁 Project Structure
