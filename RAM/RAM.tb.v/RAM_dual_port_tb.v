`timescale 1ns/1ps

module ram_dual_port1_tb;

    reg [7:0] data;
    reg [5:0] read_addr, write_addr;
    reg we;
    reg read_clk, write_clk;

    wire [7:0] q;

    ram_dual_port1 uut(
        .q(q),
        .data(data),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .we(we),
        .read_clk(read_clk),
        .write_clk(write_clk)
    );

    // Write Clock (10 ns)
    initial begin
        write_clk = 0;
        forever #5 write_clk = ~write_clk;
    end

    // Read Clock (20 ns)
    initial begin
        read_clk = 0;
        forever #10 read_clk = ~read_clk;
    end

    initial begin

        //=========================================
        // TEST CASE 1 : Write 25 to Address 5
        //=========================================
        we = 1;
        write_addr = 6'd5;
        data = 8'd25;
        read_addr = 6'd0;
        #20;

        //=========================================
        // TEST CASE 2 : Read Address 5
        //=========================================
        we = 0;
        read_addr = 6'd5;
        #20;

        //=========================================
        // TEST CASE 3 : Write 100 to Address 10
        //=========================================
        we = 1;
        write_addr = 6'd10;
        data = 8'd100;
        #20;

        //=========================================
        // TEST CASE 4 : Read Address 10
        //=========================================
        we = 0;
        read_addr = 6'd10;
        #20;

        //=========================================
        // TEST CASE 5 : Simultaneous Read & Write
        //=========================================
        we = 1;
        write_addr = 6'd20;
        data = 8'd200;
        read_addr = 6'd5;
        #20;

        //=========================================
        // TEST CASE 6 : Read Address 20
        //=========================================
        we = 0;
        read_addr = 6'd20;
        #20;

        $finish;
    end

    initial begin
        $monitor("Time=%0t WE=%b WADDR=%d RADDR=%d DATA=%d Q=%d",
                 $time,we,write_addr,read_addr,data,q);
    end

endmodule




//`timescale 1ns/1ps

//module ram_dual_port2_tb;

//    reg [7:0] data;
//    reg [5:0] read_addr, write_addr;
//    reg we;
//    reg read_clk, write_clk;

//    wire [7:0] q;

//    ram_dual_port2 uut(
//        .q(q),
//        .data(data),
//        .read_addr(read_addr),
//        .write_addr(write_addr),
//        .we(we),
//        .read_clk(read_clk),
//        .write_clk(write_clk)
//    );

//    // Write Clock (10 ns)
//    initial begin
//        write_clk = 0;
//        forever #5 write_clk = ~write_clk;
//    end

//    // Read Clock (20 ns)
//    initial begin
//        read_clk = 0;
//        forever #10 read_clk = ~read_clk;
//    end

//    initial begin

//        //=========================================
//        // TEST CASE 1 : Write 50 to Address 8
//        //=========================================
//        we = 1;
//        write_addr = 6'd8;
//        data = 8'd50;
//        read_addr = 6'd0;
//        #20;

//        //=========================================
//        // TEST CASE 2 : Read Address 8
//        // (One clock latency)
//        //=========================================
//        we = 0;
//        read_addr = 6'd8;
//        #20;

//        //=========================================
//        // TEST CASE 3 : Write 120 to Address 15
//        //=========================================
//        we = 1;
//        write_addr = 6'd15;
//        data = 8'd120;
//        #20;

//        //=========================================
//        // TEST CASE 4 : Read Address 15
//        //=========================================
//        we = 0;
//        read_addr = 6'd15;
//        #20;

//        //=========================================
//        // TEST CASE 5 : Read Address 8 While
//        // Writing Address 20
//        //=========================================
//        we = 1;
//        write_addr = 6'd20;
//        data = 8'd200;
//        read_addr = 6'd8;
//        #20;

//        //=========================================
//        // TEST CASE 6 : Read Address 20
//        //=========================================
//        we = 0;
//        read_addr = 6'd20;
//        #20;

//        $finish;
//    end

//    initial begin
//        $monitor("Time=%0t WE=%b WADDR=%d RADDR=%d DATA=%d Q=%d",
//                 $time,we,write_addr,read_addr,data,q);
//    end

//endmodule