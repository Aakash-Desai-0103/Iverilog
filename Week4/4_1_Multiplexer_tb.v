module TB;
    reg A, B, C, D;
    reg [1:0] S;  
    wire X;


    mux4 newMUX(
        .i0(A),
        .i1(B),
        .i2(C),
        .i3(D),
        .sel(S),
        .o(X)
    );

    initial begin
        $dumpfile("MUX4_test.vcd");
        $dumpvars(0, TB);
        $monitor("Time=%0t | S=%b | A=%b | B=%b | C=%b | D=%b | X=%b", $time, S, A, B, C, D, X);

       
        A=0; B=0; C=0; D=0; S=2'b00; #5;
        A=0; B=1; C=0; D=0; S=2'b01; #5;
        A=1; B=0; C=0; D=0; S=2'b10; #5;
        A=1; B=1; C=1; D=0; S=2'b11; #5;
        A=0; B=1; C=1; D=1; S=2'b10; #5;
        A=1; B=0; C=1; D=1; S=2'b01; #5;

        $finish;
    end
endmodule
