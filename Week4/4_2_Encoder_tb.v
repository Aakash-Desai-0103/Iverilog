module TB;
    reg [3:0] D;
    reg EN;
    wire [1:0] Y;
    wire VALID;

 
    enc4to2 newENC(
        .d(D),
        .en(EN),
        .y(Y),
        .valid(VALID)
    );

    initial begin
        $dumpfile("ENC4to2_test.vcd");
        $dumpvars(0, TB);
        $monitor("Time=%0t | EN=%b | D=%b | Y=%b | VALID=%b", $time, EN, D, Y, VALID);


        EN = 1'b0; D = 4'b0000; #5;
        EN = 1'b1; D = 4'b0000; #5;
        EN = 1'b1; D = 4'b0001; #5;
        EN = 1'b1; D = 4'b0010; #5;
        EN = 1'b1; D = 4'b0100; #5;
        EN = 1'b1; D = 4'b1000; #5;
        EN = 1'b0; D = 4'b1010; #5;

        $finish;
    end
endmodule
