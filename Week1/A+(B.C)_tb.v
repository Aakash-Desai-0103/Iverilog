module c1_tb;
    reg a, b, c;
    wire y;
    circuit1 uut(y, a, b, c);  
    initial begin
        a = 0; b = 0; c = 0;
        #20 a = 0; b = 0; c = 1;
        #20 a = 0; b = 1; c = 0;
        #20 a = 0; b = 1; c = 1;
        #20 a = 1; b = 0; c = 0;
        #20 a = 1; b = 0; c = 1;
        #20 a = 1; b = 1; c = 0;
        #20 a = 1; b = 1; c = 1;
        #20 $finish;
    end

    initial begin
        $monitor("%0t: a=%b b=%b c=%b y=%b", $time, a, b, c, y);
    end

    initial begin
        $dumpfile("c1_tb.vcd");
        $dumpvars(0, c1_tb);
    end
endmodule
