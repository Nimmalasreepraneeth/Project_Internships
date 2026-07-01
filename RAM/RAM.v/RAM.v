//`timescale 1ns/1ps


//module ram_single_port1(
//    output reg [7:0] q,          // Data output
//    input  [7:0] data,           // Data input
//    input  [5:0] read_addr,      // Read address
//    input  [5:0] write_addr,     // Write address
//    input  we,                   // Write enable
//    input  clk                   // Clock
//);

//    // Memory array: 64 locations, each 8 bits wide
//    reg [7:0] ram [63:0];

//    // Synchronous read and write
//    always @(posedge clk) begin
//        if (we)
//            ram[write_addr] <= data;   // Write operation

//        q <= ram[read_addr];           // Read operation
//    end

//endmodule


module ram_single_port2(
    output reg [7:0] q,          // Data output
    input  [7:0] data,           // Data input
    input  [5:0] read_addr,      // Read address
    input  [5:0] write_addr,     // Write address
    input  we,                   // Write enable
    input  clk                   // Clock
);

    // Memory array: 64 locations, each 8 bits wide
    reg [7:0] ram [63:0];

    // Synchronous read and write using blocking assignments
    always @(posedge clk) begin
        if (we)
            ram[write_addr] = data;    // Write operation

        q = ram[read_addr];            // Read operation
    end

endmodule


//module ram_single_port3(
//    output [7:0] q,            // Data output
//    input  [7:0] data,         // Data input
//    input  [5:0] addr,         // Address input
//    input  we,                 // Write enable
//    input  clk                 // Clock
//);

//    // Memory array: 64 locations, each 8 bits wide
//    reg [7:0] ram [63:0];

//    // Registered address
//    reg [5:0] addr_reg;

//    // Synchronous write and address registration
//    always @(posedge clk) begin
//        if (we)
//            ram[addr] <= data;    // Write operation

//        addr_reg <= addr;         // Register the address
//    end

//    // Asynchronous read using the registered address
//    assign q = ram[addr_reg];

//endmodule


//module ram_single_port4(
//    output [7:0] q,             // Data output
//    input  [7:0] data,          // Data input
//    input  [5:0] read_addr,     // Read address
//    input  [5:0] write_addr,    // Write address
//    input  we,                  // Write enable
//    input  clk                  // Clock
//);

//    // Memory array: 64 locations, each 8 bits wide
//    reg [7:0] ram [63:0];

//    // Registered read address
//    reg [5:0] read_addr_reg;

//    // Synchronous write and read address registration
//    always @(posedge clk) begin
//        if (we)
//            ram[write_addr] <= data;      // Write operation

//        read_addr_reg <= read_addr;       // Register the read address
//    end

//    // Asynchronous read using the registered address
//    assign q = ram[read_addr_reg];

//endmodule