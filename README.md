# Verilog – Bit Transition Counter

This project implements a **digital system in Verilog** that counts the number of bit transitions (0→1 or 1→0) in a 10-bit input data.  

---

## Problem Statement
The system should:
- Accept a **10-bit input data**.
- Use a **Load** signal to synchronously load the input data on the rising edge of the clock.
- Use an **Asynchronous Active-Low Clear** signal to reset the output.
- Compute and output the **number of bit transitions** in the loaded data.

### Example  
For input `Data = 1011001110`,  
the system counts the transitions between bits and outputs the result.

---

## Features
- **CLK**: Positive edge trigger input clock.  
- **Load**: Active High (synchronous).  
- **Clear**: Active Low (asynchronous).  
- **Data[9:0]**: 10-bit input data.  
- **Count[4:0]**: Number of transitions (0–9).  

---

## Simulation Cases
The **testbench** covers:
1. **Asynchronous Clear** – Verify reset functionality.  
2. **All possible input values (1024 cases)** – Loop through all 10-bit combinations.  
3. **Load = 0 case** – Confirm no changes occur when load is disabled.  

---

## How to Run
1. Use any Verilog simulator (e.g., **Icarus Verilog**, **ModelSim**, or **Vivado**).
2. Compile and run:
   ```bash
   iverilog -o testbench TBC.v TC.v
   vvp testbench
