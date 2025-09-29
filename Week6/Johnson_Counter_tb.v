module tb_johnson_counter_3bit;
    reg clk, reset;
    wire [2:0] q;

    johnson_counter_3bit uut(.clk(clk), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;  // 10 time unit period

    initial begin
        $dumpfile("johnson_counter.vcd");
        $dumpvars(0, tb_johnson_counter_3bit);

        $display("Time\tClk\tReset\tQ2Q1Q0");
        $monitor("%0t\t%b\t%b\t%b%b%b", $time, clk, reset, q[2], q[1], q[0]);

        reset = 1; #10;
        reset = 0;
        #100;
        $finish;
    end
endmodule
