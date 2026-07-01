`timescale 1ns/1ps

module tb_risc_processor_32bit;

reg clk;
reg reset;

// Instantiate the RISC Processor
risc_processor_32bit DUT (
    .clk(clk),
    .reset(reset)
);

//-----------------------------------------------------
// Clock Generation
//-----------------------------------------------------

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

//-----------------------------------------------------
// Test Sequence
//-----------------------------------------------------

initial begin

    $display("===============================================");
    $display("      32-bit RISC Processor Simulation");
    $display("===============================================");

    // Apply Reset
    reset = 1;
    #10;

    // Release Reset
    reset = 0;

    // Execute instructions
    #100;

    //=================================================
    // Register File Contents
    //=================================================

    $display("\n===============================================");
    $display("          REGISTER FILE CONTENTS");
    $display("===============================================");

    $display("R0  = %0d", DUT.RF.registers[0]);
    $display("R1  = %0d", DUT.RF.registers[1]);
    $display("R2  = %0d", DUT.RF.registers[2]);
    $display("R3  = %0d", DUT.RF.registers[3]);
    $display("R4  = %0d", DUT.RF.registers[4]);
    $display("R5  = %0d", DUT.RF.registers[5]);
    $display("R6  = %0d", DUT.RF.registers[6]);
    $display("R7  = %0d", DUT.RF.registers[7]);

    //=================================================
    // Data Memory Contents
    //=================================================

    $display("\n===============================================");
    $display("          DATA MEMORY CONTENTS");
    $display("===============================================");

    $display("MEM[0] = %0d", DUT.DM.memory[0]);
    $display("MEM[1] = %0d", DUT.DM.memory[1]);
    $display("MEM[2] = %0d", DUT.DM.memory[2]);
    $display("MEM[3] = %0d", DUT.DM.memory[3]);
    $display("MEM[4] = %0d", DUT.DM.memory[4]);
    $display("MEM[5] = %0d", DUT.DM.memory[5]);

    $display("\n===============================================");
    $display("Simulation Completed Successfully");
    $display("===============================================");

    $finish;

end

//-----------------------------------------------------
// Processor Monitor
//-----------------------------------------------------

initial begin

    $monitor(
        "Time=%0t | PC=%0d | Instr=%h | ALU_Result=%0d | Zero=%b",
        $time,
        DUT.pc,
        DUT.instr,
        DUT.alu_result,
        DUT.zero
    );

end

endmodule