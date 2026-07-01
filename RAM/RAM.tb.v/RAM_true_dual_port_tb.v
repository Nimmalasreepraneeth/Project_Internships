//`timescale 1ns/1ps

//module ram_true_dual_port1_tb;

//    reg [7:0] data_a, data_b;
//    reg [5:0] addr_a, addr_b;
//    reg we_a, we_b;
//    reg clk;

//    wire [7:0] q_a, q_b;

//    // Instantiate DUT
//    ram_true_dual_port1 uut(
//        .q_a(q_a),
//        .q_b(q_b),
//        .data_a(data_a),
//        .data_b(data_b),
//        .addr_a(addr_a),
//        .addr_b(addr_b),
//        .we_a(we_a),
//        .we_b(we_b),
//        .clk(clk)
//    );

//    // Clock Generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;
//    end

//    initial begin

//        //=========================================
//        // TEST CASE 1 : Write 25 to Address 5 using Port A
//        //=========================================
//        we_a = 1; we_b = 0;
//        addr_a = 6'd5;
//        data_a = 8'd25;
//        addr_b = 6'd0;
//        data_b = 8'd0;
//        #10;

//        //=========================================
//        // TEST CASE 2 : Read Address 5 using Port A
//        //=========================================
//        we_a = 0;
//        addr_a = 6'd5;
//        #10;

//        //=========================================
//        // TEST CASE 3 : Write 100 to Address 10 using Port B
//        //=========================================
//        we_b = 1;
//        addr_b = 6'd10;
//        data_b = 8'd100;
//        #10;

//        //=========================================
//        // TEST CASE 4 : Read Address 10 using Port B
//        //=========================================
//        we_b = 0;
//        addr_b = 6'd10;
//        #10;

//        //=========================================
//        // TEST CASE 5 : Simultaneous Write on Both Ports
//        //=========================================
//        we_a = 1;
//        we_b = 1;
//        addr_a = 6'd15;
//        data_a = 8'd50;
//        addr_b = 6'd20;
//        data_b = 8'd75;
//        #10;

//        //=========================================
//        // TEST CASE 6 : Read Both Locations
//        //=========================================
//        we_a = 0;
//        we_b = 0;
//        addr_a = 6'd15;
//        addr_b = 6'd20;
//        #10;

//        //=========================================
//        // TEST CASE 7 : Port A Reads While Port B Writes
//        //=========================================
//        we_a = 0;
//        addr_a = 6'd20;

//        we_b = 1;
//        addr_b = 6'd25;
//        data_b = 8'd150;
//        #10;

//        //=========================================
//        // TEST CASE 8 : Port B Reads While Port A Writes
//        //=========================================
//        we_a = 1;
//        addr_a = 6'd30;
//        data_a = 8'd200;

//        we_b = 0;
//        addr_b = 6'd25;
//        #10;

//        //=========================================
//        // TEST CASE 9 : Both Ports Read Simultaneously
//        //=========================================
//        we_a = 0;
//        we_b = 0;
//        addr_a = 6'd30;
//        addr_b = 6'd25;
//        #10;

//        //=========================================
//        // TEST CASE 10 : Both Ports Access Same Address
//        // (Write-First Behavior)
//        //=========================================
//        we_a = 1;
//        addr_a = 6'd40;
//        data_a = 8'd99;

//        we_b = 0;
//        addr_b = 6'd40;
//        #10;

//        //=========================================
//        // TEST CASE 11 : Read Same Address from Both Ports
//        //=========================================
//        we_a = 0;
//        we_b = 0;
//        addr_a = 6'd40;
//        addr_b = 6'd40;
//        #10;

//        $finish;

//    end

//    initial begin
//        $monitor("Time=%0t | WE_A=%b WE_B=%b | ADDR_A=%d DATA_A=%d Q_A=%d | ADDR_B=%d DATA_B=%d Q_B=%d",
//                  $time,we_a,we_b,addr_a,data_a,q_a,addr_b,data_b,q_b);
//    end

//endmodule


//`timescale 1ns/1ps

//module ram_true_dual_port2_tb;

//    reg [7:0] data_a, data_b;
//    reg [5:0] addr_a, addr_b;
//    reg we_a, we_b;
//    reg clk;

//    wire [7:0] q_a, q_b;

//    // Instantiate DUT
//    ram_true_dual_port2 uut(
//        .q_a(q_a),
//        .q_b(q_b),
//        .data_a(data_a),
//        .data_b(data_b),
//        .addr_a(addr_a),
//        .addr_b(addr_b),
//        .we_a(we_a),
//        .we_b(we_b),
//        .clk(clk)
//    );

//    // Clock Generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;
//    end

//    initial begin

//        //=========================================
//        // TEST CASE 1 : Write Using Port A
//        //=========================================
//        we_a = 1;
//        we_b = 0;
//        addr_a = 6'd5;
//        data_a = 8'd25;
//        #10;

//        //=========================================
//        // TEST CASE 2 : Read Using Port A
//        //=========================================
//        we_a = 0;
//        addr_a = 6'd5;
//        #10;

//        //=========================================
//        // TEST CASE 3 : Write Using Port B
//        //=========================================
//        we_b = 1;
//        addr_b = 6'd10;
//        data_b = 8'd100;
//        #10;

//        //=========================================
//        // TEST CASE 4 : Read Using Port B
//        //=========================================
//        we_b = 0;
//        addr_b = 6'd10;
//        #10;

//        //=========================================
//        // TEST CASE 5 : Simultaneous Writes
//        //=========================================
//        we_a = 1;
//        we_b = 1;
//        addr_a = 6'd15;
//        data_a = 8'd50;
//        addr_b = 6'd20;
//        data_b = 8'd75;
//        #10;

//        //=========================================
//        // TEST CASE 6 : Read Both Locations
//        //=========================================
//        we_a = 0;
//        we_b = 0;
//        addr_a = 6'd15;
//        addr_b = 6'd20;
//        #10;

//        //=========================================
//        // TEST CASE 7 : Port A Read, Port B Write
//        //=========================================
//        we_a = 0;
//        addr_a = 6'd20;

//        we_b = 1;
//        addr_b = 6'd25;
//        data_b = 8'd150;
//        #10;

//        //=========================================
//        // TEST CASE 8 : Port B Read, Port A Write
//        //=========================================
//        we_a = 1;
//        addr_a = 6'd30;
//        data_a = 8'd200;

//        we_b = 0;
//        addr_b = 6'd25;
//        #10;

//        //=========================================
//        // TEST CASE 9 : Both Ports Read
//        //=========================================
//        we_a = 0;
//        we_b = 0;
//        addr_a = 6'd30;
//        addr_b = 6'd25;
//        #10;

//        //=========================================
//        // TEST CASE 10 : Same Address Access
//        // (Read-First Behavior)
//        //=========================================
//        we_a = 1;
//        addr_a = 6'd40;
//        data_a = 8'd99;

//        we_b = 0;
//        addr_b = 6'd40;
//        #10;

//        //=========================================
//        // TEST CASE 11 : Read Updated Address
//        //=========================================
//        we_a = 0;
//        we_b = 0;
//        addr_a = 6'd40;
//        addr_b = 6'd40;
//        #10;

//        $finish;

//    end

//    initial begin
//        $monitor("Time=%0t | WE_A=%b WE_B=%b | ADDR_A=%d DATA_A=%d Q_A=%d | ADDR_B=%d DATA_B=%d Q_B=%d",
//                  $time,we_a,we_b,addr_a,data_a,q_a,addr_b,data_b,q_b);
//    end

//endmodule