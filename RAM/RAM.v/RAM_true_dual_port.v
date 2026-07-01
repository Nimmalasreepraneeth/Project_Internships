//module ram_true_dual_port1(
//    output reg [7:0] q_a,
//    output reg [7:0] q_b,
//    input  [7:0] data_a,
//    input  [7:0] data_b,
//    input  [5:0] addr_a,
//    input  [5:0] addr_b,
//    input  we_a,
//    input  we_b,
//    input  clk
//);

//    // Memory array
//    reg [7:0] ram [63:0];

//    // Port A
//    always @(posedge clk) begin
//        if (we_a) begin
//            ram[addr_a] <= data_a;
//            q_a <= data_a;          // Write-First behavior
//        end
//        else begin
//            q_a <= ram[addr_a];
//        end
//    end

//    // Port B
//    always @(posedge clk) begin
//        if (we_b) begin
//            ram[addr_b] <= data_b;
//            q_b <= data_b;          // Write-First behavior
//        end
//        else begin
//            q_b <= ram[addr_b];
//        end
//    end

//endmodule


//module ram_true_dual_port2(
//    output reg [7:0] q_a,
//    output reg [7:0] q_b,
//    input  [7:0] data_a,
//    input  [7:0] data_b,
//    input  [5:0] addr_a,
//    input  [5:0] addr_b,
//    input  we_a,
//    input  we_b,
//    input  clk
//);

//    // Memory array
//    reg [7:0] ram [63:0];

//    // Port A
//    always @(posedge clk) begin
//        if (we_a)
//            ram[addr_a] <= data_a;

//        q_a <= ram[addr_a];     // Read-First behavior
//    end

//    // Port B
//    always @(posedge clk) begin
//        if (we_b)
//            ram[addr_b] <= data_b;

//        q_b <= ram[addr_b];     // Read-First behavior
//    end

//endmodule