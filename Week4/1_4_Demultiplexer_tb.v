module TB;
    reg IN;
    reg [1:0] S; 
    wire Y0, Y1, Y2, Y3;

   
    demux1to4 newDEMUX(
        .i(IN),
        .sel(S),
        .y0(Y0),
        .y1(Y1),
        .y2(Y2),
        .y3(Y3)
    );

    initial begin
        $dumpfile("DEMUX1to4_test.vcd");
        $dumpvars(0, TB);
        $monitor("Time=%0t | S=%b | IN=%b | Y0=%b | Y1=%b | Y2=%b | Y3=%b", $time, S, IN, Y0, Y1, Y2, Y3);

      
        IN = 1'b0; S = 2'b00; #5;
        IN = 1'b1; S = 2'b00; #5;
        IN = 1'b1; S = 2'b01; #5;
        IN = 1'b1; S = 2'b10; #5;
        IN = 1'b1; S = 2'b11; #5;
        IN = 1'b0; S = 2'b10; #5;

        $finish;
    end
endmodule
