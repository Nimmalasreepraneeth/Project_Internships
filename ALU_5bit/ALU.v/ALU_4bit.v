module ALU( x,y,a,b,opcode);

input  [3:0] a, b;
input  [3:0] opcode;

output reg [3:0] x;
output reg [3:0] y;

always @(a, b, opcode) begin
    case (opcode)

        4'b0000: x = a;            // Pass A

        4'b0001: x = &a;           // AND reduction

        4'b0010: x = ^a;           // XOR reduction

        4'b0011: x = a & b;        // AND operation

        4'b0100: x = a | b;        // OR operation

        4'b0101: x = a ^ b;        // XOR operation

        4'b0110: x = (a > b);      // A > B comparison

        4'b0111: x = (a < b);      // A < B comparison

        4'b1000: x = ~a;           // NOT operation

        4'b1001: x = (a == b);     // Equality check

        4'b1010: {y, x} = a + b;   // Addition

        4'b1011: x = a - b;        // Subtraction

        4'b1100: {y, x} = a * b;   // Multiplication

        4'b1101: x = a >> b;       // Right shift

        4'b1110: x = a << b;       // Left shift

        4'b1111: x = -a;           // Negation

        default: $display("error");

    endcase
end

endmodule