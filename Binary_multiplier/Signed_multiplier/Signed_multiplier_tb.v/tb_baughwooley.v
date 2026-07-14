
//`timescale 1ns/1ps

//module tb_BaughWooley4x4;

//reg  [3:0] A;
//reg  [3:0] B;

//wire [7:0] p;
//wire [7:0] out;

//BaughWooley4x4 DUT(
//    .A(A),
//    .B(B),
//    .p(p),
//    .out(out)
//);

//initial
//begin

//    $display("---------------------------------------------------------------");
//    $display(" Time\tA\tB\tProduct");
//    $display("---------------------------------------------------------------");

//    // Test Case 1
//    A = 4'b0000; B = 4'b0000;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 2
//    A = 4'b0001; B = 4'b0001;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 3
//    A = 4'b0010; B = 4'b0011;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 4
//    A = 4'b0100; B = 4'b0101;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 5
//    A = 4'b0111; B = 4'b0111;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 6 (-1 × 3)
//    A = 4'b1111;
//    B = 4'b0011;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 7 (-2 × 4)
//    A = 4'b1110;
//    B = 4'b0100;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 8 (-3 × -2)
//    A = 4'b1101;
//    B = 4'b1110;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 9 (Maximum Positive)
//    A = 4'b0111;
//    B = 4'b0111;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    // Test Case 10 (Minimum Negative × -1)
//    A = 4'b1000;
//    B = 4'b1111;
//    #10;
//    $display("%0t\t%b\t%b\t%b",$time,A,B,p,out);

//    $display("---------------------------------------------------------------");
//    $finish;

//end

//endmodule


`timescale 1ns/1ps

module tb_BaughWooley4x4;

reg  [3:0] A;
reg  [3:0] B;

wire [7:0] p;
wire [7:0] out;

BaughWooley4x4 DUT(
    .A(A),
    .B(B),
    .p(p),
    .out(out)
);

initial
begin

    $display("-------------------------------------------------------------");
    $display("Time\tA\tB\tProduct");
    $display("-------------------------------------------------------------");

    // Zero cases
    A = 4'b0000; B = 4'b0000; #10;
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b0000; B = 4'b0111; #10;
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1000; B = 4'b0000; #10;
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    // One and minus one
    A = 4'b0001; B = 4'b0001; #10;
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1111; B = 4'b0001; #10;   // -1 × 1
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1111; B = 4'b1111; #10;   // -1 × -1
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    // Maximum positive
    A = 4'b0111; B = 4'b0111; #10;   // 7 × 7
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    // Minimum negative
    A = 4'b1000; B = 4'b1000; #10;   // -8 × -8
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1000; B = 4'b0111; #10;   // -8 × 7
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b0111; B = 4'b1000; #10;   // 7 × -8
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1000; B = 4'b1111; #10;   // -8 × -1
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1111; B = 4'b1000; #10;   // -1 × -8
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    // Mixed sign cases
    A = 4'b0011; B = 4'b1101; #10;   // 3 × -3
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1101; B = 4'b0011; #10;   // -3 × 3
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    // Random values
    A = 4'b0101; B = 4'b0011; #10;   // 5 × 3
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    A = 4'b1010; B = 4'b1101; #10;   // -6 × -3
    $display("%0t\t%b\t%b\t%b",$time,A,B,out);

    $display("-------------------------------------------------------------");
    $finish;

end

endmodule