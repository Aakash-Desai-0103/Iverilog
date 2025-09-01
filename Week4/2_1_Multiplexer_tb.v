module TB;
    reg A, B, S;
    wire X;

 
    mux2 newMUX(
        .i0(A),
        .i1(B),
        .j(S),
        .o(X)
    );

    initial begin
        $dumpfile("MUX2_test.vcd");
        $dumpvars(0, TB);
        $monitor("Time=%0t | S=%b | A=%b | B=%b | X=%b", $time, S, A, B, X);

        // Test all combinations
        A = 1'b0; B = 1'b0; S = 1'b0; #5;
        A = 1'b0; B = 1'b0; S = 1'b1; #5;
        A = 1'b0; B = 1'b1; S = 1'b0; #5;
        A = 1'b0; B = 1'b1; S = 1'b1; #5;
        A = 1'b1; B = 1'b0; S = 1'b0; #5;
        A = 1'b1; B = 1'b0; S = 1'b1; #5;
        A = 1'b1; B = 1'b1; S = 1'b0; #5;
        A = 1'b1; B = 1'b1; S = 1'b1; #5;

        $finish;
    end
endmodule
