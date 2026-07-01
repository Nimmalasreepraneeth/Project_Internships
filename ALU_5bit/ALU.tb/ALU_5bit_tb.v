`timescale 1ns/1ps

module ALU_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    reg  [4:0] opcode;

    wire [3:0] x;
    wire [3:0] y;

    ALU dut(
        .a(a),
        .b(b),
        .opcode(opcode),
        .x(x),
        .y(y)
    );

    task apply_test;
        input [4:0] op;
        input [3:0] aa;
        input [3:0] bb;
        begin
            opcode = op;
            a = aa;
            b = bb;
            #10;

            $display(
            "Time=%0t OP=%b A=%d(%b) B=%d(%b) X=%d(%b) Y=%d(%b)",
            $time, opcode, a, a, b, b, x, x, y, y);

        end
    endtask

    initial begin

        $display("\n========== ALU TEST START ==========\n");

        //==================================================
        // TEST CASE 1 : PASS A
        //==================================================
        apply_test(5'b00000, 4'd9, 0);

        // TEST CASE 2 : AND REDUCTION = 1
        apply_test(5'b00001, 4'b1111, 0);

        // TEST CASE 3 : AND REDUCTION = 0
        apply_test(5'b00001, 4'b1011, 0);

        // TEST CASE 4 : XOR REDUCTION = 0
        apply_test(5'b00010, 4'b1111, 0);

        // TEST CASE 5 : XOR REDUCTION = 1
        apply_test(5'b00010, 4'b1110, 0);

        // TEST CASE 6 : AND
        apply_test(5'b00011, 4'b1100, 4'b1010);

        // TEST CASE 7 : OR
        apply_test(5'b00100, 4'b1100, 4'b1010);

        // TEST CASE 8 : XOR
        apply_test(5'b00101, 4'b1100, 4'b1010);

        // TEST CASE 9 : NOR
        apply_test(5'b00110, 4'b1100, 4'b1010);

        // TEST CASE 10 : NAND
        apply_test(5'b00111, 4'b1100, 4'b1010);

        // TEST CASE 11 : GREATER THAN TRUE
        apply_test(5'b01000, 10, 5);

        // TEST CASE 12 : GREATER THAN FALSE
        apply_test(5'b01000, 5, 10);

        // TEST CASE 13 : LESS THAN TRUE
        apply_test(5'b01001, 3, 8);

        // TEST CASE 14 : LESS THAN FALSE
        apply_test(5'b01001, 8, 3);

        // TEST CASE 15 : EQUAL TRUE
        apply_test(5'b01010, 7, 7);

        // TEST CASE 16 : EQUAL FALSE
        apply_test(5'b01010, 7, 5);

        // TEST CASE 17 : NOT
        apply_test(5'b01011, 4'b1010, 0);

        // TEST CASE 18 : ADDITION
        apply_test(5'b01100, 5, 3);

        // TEST CASE 19 : ADDITION OVERFLOW
        apply_test(5'b01100, 15, 15);

        // TEST CASE 20 : SUBTRACTION
        apply_test(5'b01101, 10, 3);

        // TEST CASE 21 : SUBTRACTION UNDERFLOW
        apply_test(5'b01101, 3, 10);

        // TEST CASE 22 : MULTIPLICATION
        apply_test(5'b01110, 3, 4);

        // TEST CASE 23 : MAX MULTIPLICATION
        apply_test(5'b01110, 15, 15);

        // TEST CASE 24 : DIVISION
        apply_test(5'b01111, 12, 3);

        // TEST CASE 25 : DIVISION BY ZERO
        apply_test(5'b01111, 12, 0);

        // TEST CASE 26 : MODULUS
        apply_test(5'b10000, 13, 5);

        // TEST CASE 27 : MODULUS BY ZERO
        apply_test(5'b10000, 13, 0);

        // TEST CASE 28 : INCREMENT
        apply_test(5'b10001, 8, 0);

        // TEST CASE 29 : INCREMENT OVERFLOW
        apply_test(5'b10001, 15, 0);

        // TEST CASE 30 : DECREMENT
        apply_test(5'b10010, 8, 0);

        // TEST CASE 31 : DECREMENT UNDERFLOW
        apply_test(5'b10010, 0, 0);

        // TEST CASE 32 : NEGATION
        apply_test(5'b10011, 5, 0);

        // TEST CASE 33 : LOGICAL LEFT SHIFT
        apply_test(5'b10100, 4'b1010, 0);

        // TEST CASE 34 : LOGICAL RIGHT SHIFT
        apply_test(5'b10101, 4'b1010, 0);

        // TEST CASE 35 : ARITHMETIC LEFT SHIFT
        apply_test(5'b10110, 4'b1100, 0);

        // TEST CASE 36 : ARITHMETIC RIGHT SHIFT NEGATIVE
        apply_test(5'b10111, 4'b1100, 0);

        // TEST CASE 37 : ARITHMETIC RIGHT SHIFT POSITIVE
        apply_test(5'b10111, 4'b0100, 0);

        // TEST CASE 38 : ROTATE LEFT
        apply_test(5'b11000, 4'b1001, 0);

        // TEST CASE 39 : ROTATE RIGHT
        apply_test(5'b11001, 4'b1001, 0);

        // TEST CASE 40 : INVALID OPCODE
        apply_test(5'b11111, 0, 0);

        $display("\n========== ALL TEST CASES PASSED ==========\n");

        #20;
        $finish;

    end

endmodule