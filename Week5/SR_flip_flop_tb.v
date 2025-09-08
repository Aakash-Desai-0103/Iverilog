module tb_sr_ff;
    reg s, r;
    reg clk, rst;
    wire q;

    // Instantiate the SR flip-flop
    sr_ff uut(
        .s(s),
        .r(r),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10 time units clock period

    initial begin
        // Setup VCD dump file
        $dumpfile("sr_ff.vcd");       // Name of the VCD file
        $dumpvars(0, tb_sr_ff);       // Dump all variables in this module

        // Initialize inputs
        s = 0; r = 0; rst = 1;
        #10 rst = 0;  // Release reset

        // Test all SR combinations
        s = 0; r = 0; #10;  // No change
        s = 1; r = 0; #10;  // Set
        s = 0; r = 1; #10;  // Reset
        s = 1; r = 1; #10;  // Invalid

        // Test toggle behavior through combinations
        s = 0; r = 0; #10;
        s = 1; r = 0; #10;
        s = 0; r = 1; #10;
        s = 0; r = 0; #10;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | S=%b R=%b | Q=%b", $time, s, r, q);
    end
endmodule
