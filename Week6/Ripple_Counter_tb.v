module tb_ripple_up_counter_2bit;
    reg clk;
    reg reset;
    wire [1:0] q;
    ripple_up_counter_2bit uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Setup waveform dumping
        $dumpfile("ripple.vcd");
        $dumpvars(0, tb_ripple_up_counter_2bit);

        // Setup console monitoring
        $display("Time\tClk\tReset\tQ1Q0");
        $monitor("%0t\t%b\t%b\t%b%b", $time, clk, reset, q[1], q[0]);

        // 1. Assert reset at the beginning to initialize the counter
        reset = 1;
        #12; // Hold reset for a duration

        // 2. De-assert reset and let the counter run
        reset = 0;
        #80; // Run for 80 time units

        // 3. End the simulation
        $finish;
    end
endmodule
