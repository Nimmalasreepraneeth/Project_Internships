`timescale 1ns/1ps

module tb_ALU;

reg  [3:0] a, b;
reg  [3:0] opcode;
wire [3:0] x, y;

ALU DUT (
    .x(x),
    .y(y),
    .a(a),
    .b(b),
    .opcode(opcode)
);

initial begin

    $display("-------------------------------------------------------------");
    $display("Time\tOpcode\tA\tB\tY\tX");
    $display("-------------------------------------------------------------");

    // Pass A
    opcode = 4'b0000; a = 4'd9;  b = 4'd5; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // AND Reduction
    opcode = 4'b0001; a = 4'b1111; b = 0; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    opcode = 4'b0001; a = 4'b1011; b = 0; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    // XOR Reduction
    opcode = 4'b0010; a = 4'b1111; b = 0; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    opcode = 4'b0010; a = 4'b1011; b = 0; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    // AND
    opcode = 4'b0011; a = 4'b1100; b = 4'b1010; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    // OR
    opcode = 4'b0100; a = 4'b1100; b = 4'b0011; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    // XOR
    opcode = 4'b0101; a = 4'b1111; b = 4'b1010; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    // Greater Than
    opcode = 4'b0110; a = 4'd12; b = 4'd5; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    opcode = 4'b0110; a = 4'd3; b = 4'd8; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Less Than
    opcode = 4'b0111; a = 4'd3; b = 4'd8; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    opcode = 4'b0111; a = 4'd10; b = 4'd2; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // NOT
    opcode = 4'b1000; a = 4'b1010; b = 0; #10;
    $display("%0t\t%b\t%b\t%b\t%b\t%b",$time,opcode,a,b,y,x);

    // Equal
    opcode = 4'b1001; a = 4'd7; b = 4'd7; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    opcode = 4'b1001; a = 4'd7; b = 4'd5; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Addition
    opcode = 4'b1010; a = 4'd5; b = 4'd6; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Addition Overflow
    opcode = 4'b1010; a = 4'd15; b = 4'd15; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Subtraction
    opcode = 4'b1011; a = 4'd10; b = 4'd3; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Subtraction Underflow
    opcode = 4'b1011; a = 4'd3; b = 4'd10; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Multiplication
    opcode = 4'b1100; a = 4'd4; b = 4'd3; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Multiplication Max
    opcode = 4'b1100; a = 4'd15; b = 4'd15; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Right Shift
    opcode = 4'b1101; a = 4'b1111; b = 4'd2; #10;
    $display("%0t\t%b\t%b\t%d\t%b\t%b",$time,opcode,a,b,y,x);

    // Left Shift
    opcode = 4'b1110; a = 4'b0011; b = 4'd2; #10;
    $display("%0t\t%b\t%b\t%d\t%b\t%b",$time,opcode,a,b,y,x);

    // Negation
    opcode = 4'b1111; a = 4'd5; b = 0; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    // Negation of Zero
    opcode = 4'b1111; a = 4'd0; b = 0; #10;
    $display("%0t\t%b\t%d\t%d\t%d\t%d",$time,opcode,a,b,y,x);

    $display("-------------------------------------------------------------");
    $finish;

end

endmodule