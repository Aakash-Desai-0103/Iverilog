module tb_ring_counter_3bit;
    reg clk, reset;
    wire [2:0] q;

    ring_counter_3bit uut(.clk(clk), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;  // 10 time unit period

    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, tb_ring_counter_3bit);

        $display("Time\tClk\tReset\tQ2Q1Q0");
        $monitor("%0t\t%b\t%b\t%b%b%b", $time, clk, reset, q[2], q[1], q[0]);

        reset = 1; #10;
        reset = 0;

        uut.dff0.q = 1'b1;  // force Q0 = 1
        uut.dff1.q = 1'b0;
        uut.dff2.q = 1'b0;
        #80;
        $finish;
    end
endmodule
