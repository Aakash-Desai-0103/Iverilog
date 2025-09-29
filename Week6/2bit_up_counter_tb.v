module tb_up_counter_2bit;
    reg clk, reset;
    wire [1:0] q;

    up_counter_2bit uut(.clk(clk), .reset(reset), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("up_counter_jk.vcd");
        $dumpvars(0, tb_up_counter_2bit);
        $display("Time\tClk\tReset\tQ1Q0");
        $monitor("%0t\t%b\t%b\t%b%b", $time, clk, reset, q[1], q[0]);

        reset = 1; #10;   // apply reset
        reset = 0;        // release reset
        #60;

        reset = 1; #10;   // reset again
        reset = 0;        // release reset
        #40;

        $finish;
    end
endmodule
