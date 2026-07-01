module ALU (
    input  [3:0] a,
    input  [3:0] b,
    input  [4:0] opcode,
    output reg [3:0] x,
    output reg [3:0] y
);

always @(*) begin
    x = 4'b0000;
    y = 4'b0000;

    case (opcode)

        5'b00000: x = a;                   // Pass A
        5'b00001: x = {3'b000, &a};        // AND Reduction
        5'b00010: x = {3'b000, ^a};        // XOR Reduction

        5'b00011: x = a & b;               // AND
        5'b00100: x = a | b;               // OR
        5'b00101: x = a ^ b;               // XOR
        5'b00110: x = ~(a | b);            // NOR
        5'b00111: x = ~(a & b);            // NAND

        5'b01000: x = {3'b000,(a>b)};      // Greater than
        5'b01001: x = {3'b000,(a<b)};      // Less than
        5'b01010: x = {3'b000,(a==b)};     // Equality

        5'b01011: x = ~a;                  // NOT

        5'b01100: {y,x} = a + b;           // Addition
        5'b01101: x = a - b;               // Subtraction
        5'b01110: {y,x} = a * b;           // Multiplication
        5'b01111: x = (b != 0) ? a / b : 0;// Division
        5'b10000: x = (b != 0) ? a % b : 0;// Modulus

        5'b10001: x = a + 1;               // Increment
        5'b10010: x = a - 1;               // Decrement
        5'b10011: x = -a;                  // Two's Complement

        5'b10100: x = a << 1;              // Logical Left Shift
        5'b10101: x = a >> 1;              // Logical Right Shift

        5'b10110: x = $signed(a) <<< 1;    // Arithmetic Left Shift
        5'b10111: x = $signed(a) >>> 1;    // Arithmetic Right Shift

        5'b11000: x = {a[2:0],a[3]};       // Rotate Left
        5'b11001: x = {a[0],a[3:1]};       // Rotate Right

        default: begin
            x = 4'b0000;
            y = 4'b0000;
        end

    endcase
end

endmodule