module tb_up_down_counter_2bit;
    reg clk, reset, up_down;
    wire [1:0] q;

    up_down_counter_2bit uut(.clk(clk), .reset(reset), .up_down(up_down), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("up_down_counter_jk.vcd");
        $dumpvars(0, tb_up_down_counter_2bit);
        $display("Time\tClk\tReset\tUD\tQ1Q0");
        $monitor("%0t\t%b\t%b\t%b\t%b%b", $time, clk, reset, up_down, q[1], q[0]);

        reset = 1; up_down = 1; #10;
        reset = 0;

        #40;

        up_down = 0;
        #40;

        $finish;
    end
endmodule
