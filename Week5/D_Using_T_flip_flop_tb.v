// ------------------------------
// Testbench for D Flip-Flop Using T Flip-Flop
// ------------------------------
module tb_d_ff_using_t;
    reg d;
    reg clk, rst;
    wire q;

    // Instantiate D flip-flop
    d_ff_using_t uut(
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10 time units period

    // Test sequence
    initial begin
        // Setup VCD dump file
        $dumpfile("d_ff_using_t.vcd");  // Name of the VCD file
        $dumpvars(0, tb_d_ff_using_t);  // Dump all variables in this module

        d = 0; rst = 1;
        #10 rst = 0; // Release reset

        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;
        d = 0; #10;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | D=%b | Q=%b", $time, d, q);
    end
endmodule
