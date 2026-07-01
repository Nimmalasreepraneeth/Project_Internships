`timescale 1ns/1ps

//module ram_single_port1_tb;

//    reg  [7:0] data;
//    reg  [5:0] read_addr, write_addr;
//    reg  we, clk;
//    wire [7:0] q;

//    // Instantiate the DUT
//    ram_single_port1 uut (
//        .q(q),
//        .data(data),
//        .read_addr(read_addr),
//        .write_addr(write_addr),
//        .we(we),
//        .clk(clk)
//    );

//    // Clock generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;
//    end

//    initial begin

//        //===============================
//        // TEST CASE 1 : Write 25 to Address 5
//        //===============================
//        we = 1;
//        write_addr = 6'd5;
//        read_addr  = 6'd0;
//        data = 8'd25;
//        #10;

//        //===============================
//        // TEST CASE 2 : Read Address 5
//        //===============================
//        we = 0;
//        read_addr = 6'd5;
//        #10;

//        //===============================
//        // TEST CASE 3 : Write 100 to Address 10
//        //===============================
//        we = 1;
//        write_addr = 6'd10;
//        data = 8'd100;
//        #10;

//        //===============================
//        // TEST CASE 4 : Read Address 10
//        //===============================
//        we = 0;
//        read_addr = 6'd10;
//        #10;

//        //===============================
//        // TEST CASE 5 : Read and Write Same Address
//        // Expected: q shows OLD data during write
//        //===============================
//        we = 1;
//        write_addr = 6'd10;
//        read_addr  = 6'd10;
//        data = 8'd200;
//        #10;

//        //===============================
//        // TEST CASE 6 : Read Address 10 Again
//        // Expected: q = 200
//        //===============================
//        we = 0;
//        read_addr = 6'd10;
//        #10;

//        $finish;

//    end

//    initial begin
//        $monitor("Time=%0t WE=%b WADDR=%d RADDR=%d DATA=%d Q=%d",
//                  $time, we, write_addr, read_addr, data, q);
//    end

//endmodule

//`timescale 1ns/1ps

//module ram_single_port2_tb;

//    reg  [7:0] data;
//    reg  [5:0] read_addr, write_addr;
//    reg  we, clk;

//    wire [7:0] q;

//    // Instantiate the DUT
//    ram_single_port2 uut (
//        .q(q),
//        .data(data),
//        .read_addr(read_addr),
//        .write_addr(write_addr),
//        .we(we),
//        .clk(clk)
//    );

//    // Clock Generation (10 ns period)
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;
//    end

//    initial begin

//        //=========================================
//        // TEST CASE 1 : Write 25 to Address 5
//        //=========================================
//        we = 1;
//        write_addr = 6'd5;
//        read_addr  = 6'd0;
//        data = 8'd25;
//        #10;

//        //=========================================
//        // TEST CASE 2 : Read Address 5
//        //=========================================
//        we = 0;
//        read_addr = 6'd5;
//        #10;

//        //=========================================
//        // TEST CASE 3 : Write 100 to Address 10
//        //=========================================
//        we = 1;
//        write_addr = 6'd10;
//        data = 8'd100;
//        #10;

//        //=========================================
//        // TEST CASE 4 : Read Address 10
//        //=========================================
//        we = 0;
//        read_addr = 6'd10;
//        #10;

//        //=========================================
//        // TEST CASE 5 : Read and Write SAME Address
//        // Expected: q = NEW DATA (200)
//        //=========================================
//        we = 1;
//        write_addr = 6'd10;
//        read_addr  = 6'd10;
//        data = 8'd200;
//        #10;

//        //=========================================
//        // TEST CASE 6 : Read Address 10 Again
//        // Expected: q = 200
//        //=========================================
//        we = 0;
//        read_addr = 6'd10;
//        #10;

//        $finish;

//    end

//    initial begin
//        $monitor("Time=%0t | WE=%b | WADDR=%d | RADDR=%d | DATA=%d | Q=%d",
//                  $time, we, write_addr, read_addr, data, q);
//    end

//endmodule


//`timescale 1ns/1ps

//module ram_single_port3_tb;

//    reg  [7:0] data;
//    reg  [5:0] addr;
//    reg  we, clk;

//    wire [7:0] q;

//    // Instantiate DUT
//    ram_single_port3 uut(
//        .q(q),
//        .data(data),
//        .addr(addr),
//        .we(we),
//        .clk(clk)
//    );

//    // Clock Generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;
//    end

//    initial begin

//        //=========================================
//        // TEST CASE 1 : Write 25 to Address 5
//        //=========================================
//        we = 1;
//        addr = 6'd5;
//        data = 8'd25;
//        #10;

//        //=========================================
//        // TEST CASE 2 : Read Address 5
//        // (Output appears after one clock)
//        //=========================================
//        we = 0;
//        addr = 6'd5;
//        #10;

//        //=========================================
//        // TEST CASE 3 : Write 100 to Address 10
//        //=========================================
//        we = 1;
//        addr = 6'd10;
//        data = 8'd100;
//        #10;

//        //=========================================
//        // TEST CASE 4 : Read Address 10
//        //=========================================
//        we = 0;
//        addr = 6'd10;
//        #10;

//        //=========================================
//        // TEST CASE 5 : Overwrite Address 10
//        //=========================================
//        we = 1;
//        addr = 6'd10;
//        data = 8'd200;
//        #10;

//        //=========================================
//        // TEST CASE 6 : Read Updated Address 10
//        //=========================================
//        we = 0;
//        addr = 6'd10;
//        #10;

//        $finish;

//    end

//    initial begin
//        $monitor("Time=%0t WE=%b ADDR=%d DATA=%d Q=%d",
//                 $time,we,addr,data,q);
//    end

//endmodule

//`timescale 1ns/1ps

//module ram_single_port4_tb;

//    reg  [7:0] data;
//    reg  [5:0] read_addr;
//    reg  [5:0] write_addr;
//    reg  we, clk;

//    wire [7:0] q;

//    // Instantiate DUT
//    ram_single_port4 uut(
//        .q(q),
//        .data(data),
//        .read_addr(read_addr),
//        .write_addr(write_addr),
//        .we(we),
//        .clk(clk)
//    );

//    // Clock Generation
//    initial begin
//        clk = 0;
//        forever #5 clk = ~clk;
//    end

//    initial begin

//        //=========================================
//        // TEST CASE 1 : Write 55 to Address 8
//        //=========================================
//        we = 1;
//        write_addr = 6'd8;
//        read_addr  = 6'd0;
//        data = 8'd55;
//        #10;

//        //=========================================
//        // TEST CASE 2 : Read Address 8
//        // (One clock latency)
//        //=========================================
//        we = 0;
//        read_addr = 6'd8;
//        #10;

//        //=========================================
//        // TEST CASE 3 : Write 120 to Address 20
//        //=========================================
//        we = 1;
//        write_addr = 6'd20;
//        data = 8'd120;
//        #10;

//        //=========================================
//        // TEST CASE 4 : Read Address 20
//        //=========================================
//        we = 0;
//        read_addr = 6'd20;
//        #10;

//        //=========================================
//        // TEST CASE 5 : Simultaneous Read and Write
//        // Read Address 8 while Writing Address 30
//        //=========================================
//        we = 1;
//        write_addr = 6'd30;
//        read_addr  = 6'd8;
//        data = 8'd210;
//        #10;

//        //=========================================
//        // TEST CASE 6 : Read Address 30
//        //=========================================
//        we = 0;
//        read_addr = 6'd30;
//        #10;

//        $finish;

//    end

//    initial begin
//        $monitor("Time=%0t WE=%b WADDR=%d RADDR=%d DATA=%d Q=%d",
//                 $time,we,write_addr,read_addr,data,q);
//    end

//endmodule