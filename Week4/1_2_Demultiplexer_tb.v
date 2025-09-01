module TB;
    reg IN;
    reg S;       
    wire Y0, Y1;


    demux1to2 newDEMUX(
        .i(IN),
        .sel(S),
        .y0(Y0),
        .y1(Y1)
    );

    initial begin
        $dumpfile("DEMUX1to2_test.vcd");
        $dumpvars(0, TB);
        $monitor("Time=%0t | S=%b | IN=%b | Y0=%b | Y1=%b", $time, S, IN, Y0, Y1);

 
        IN = 1'b0; S = 1'b0; #5;
        IN = 1'b1; S = 1'b0; #5;
        IN = 1'b1; S = 1'b1; #5;
        IN = 1'b0; S = 1'b1; #5;

        $finish;
    end
endmodule
