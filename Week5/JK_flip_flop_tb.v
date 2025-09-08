module tb_jk;
    reg J, K, CLK, RST;
    wire Q;

    // Instantiate JK flip-flop
    jk_ff uut (
        .j(J),
        .k(K),
        .clk(CLK),
        .rst(RST),
        .q(Q)
    );

    // Clock generation (10 time units period)
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    // Waveform dump
    initial begin
        $dumpfile("jk.vcd");
        $dumpvars(0, tb_jk);
    end

    // Stimulus
    initial begin
        RST = 1; J = 0; K = 0; #12;   // Apply reset
        RST = 0;

        // Test all JK combinations
        J = 0; K = 0; #10;   // No change
        J = 0; K = 1; #10;   // Reset
        J = 1; K = 0; #10;   // Set
        J = 1; K = 1; #10;   // Toggle
        J = 1; K = 1; #10;   // Toggle again
        J = 0; K = 1; #10;   // Reset
        J = 1; K = 0; #10;   // Set

        $finish;
    end

    // Truth table monitor
    initial begin
        $display("Time\tRST\tCLK\tJ\tK\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, RST, CLK, J, K, Q);
    end
endmodule
