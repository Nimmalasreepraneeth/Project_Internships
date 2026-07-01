module ram_dual_port1(
    output reg [7:0] q,
    input  [7:0] data,
    input  [5:0] read_addr,
    input  [5:0] write_addr,
    input  we,
    input  read_clk,
    input  write_clk
);

    // Memory array: 64 locations, each 8 bits wide
    reg [7:0] ram [63:0];

    // Write operation
    always @(posedge write_clk) begin
        if (we)
            ram[write_addr] <= data;
    end

    // Read operation
    always @(posedge read_clk) begin
        q <= ram[read_addr];
    end

endmodule


//module ram_dual_port2(
//    output reg [7:0] q,
//    input  [7:0] data,
//    input  [5:0] read_addr,
//    input  [5:0] write_addr,
//    input  we,
//    input  read_clk,
//    input  write_clk
//);

//    // Memory array: 64 locations, each 8 bits wide
//    reg [7:0] ram [63:0];

//    // Registered read address
//    reg [5:0] read_addr_reg;

//    // Write operation
//    always @(posedge write_clk) begin
//        if (we)
//            ram[write_addr] <= data;
//    end

//    // Read operation with registered address
//    always @(posedge read_clk) begin
//        q <= ram[read_addr_reg];
//        read_addr_reg <= read_addr;
//    end

//endmodule