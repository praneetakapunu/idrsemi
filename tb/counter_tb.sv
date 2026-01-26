// Testbench for counter module
// Part of IDRSEMI open source chip design

`timescale 1ns/1ps

module counter_tb;

    parameter WIDTH = 8;
    parameter CLK_PERIOD = 10; // 100MHz

    // Signals
    logic             clk;
    logic             rst_n;
    logic             enable;
    logic [WIDTH-1:0] count;
    logic             overflow;

    // Instantiate DUT
    counter #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .count(count),
        .overflow(overflow)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize
        rst_n = 0;
        enable = 0;
        
        // Dump waveforms
        $dumpfile("counter_tb.vcd");
        $dumpvars(0, counter_tb);
        
        // Reset sequence
        #(CLK_PERIOD * 2);
        rst_n = 1;
        #(CLK_PERIOD);
        
        // Test counting
        enable = 1;
        #(CLK_PERIOD * 260); // Count through overflow
        
        // Test disable
        enable = 0;
        #(CLK_PERIOD * 10);
        
        // Test re-enable
        enable = 1;
        #(CLK_PERIOD * 50);
        
        $display("Test completed successfully");
        $finish;
    end

    // Monitor
    always @(posedge clk) begin
        if (overflow) begin
            $display("Time %0t: Overflow detected at count %d", $time, count);
        end
    end

endmodule