`timescale 1ns/1ps
module tb_bcd_adder;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] SUM;
    wire Cout;

    
    bcd_adder dut (.A(A), .B(B), .Cin(Cin), .SUM(SUM), .Cout(Cout));

    initial begin
        $dumpfile("bcd_adder.vcd");
        $dumpvars(0, tb_bcd_adder);

        // Some test cases
        A=4'd3; B=4'd5; Cin=0; #10;   
        A=4'd6; B=4'd7; Cin=0; #10;   
        A=4'd9; B=4'd9; Cin=0; #10;   
        A=4'd4; B=4'd9; Cin=1; #10;   
        A=4'd0; B=4'd0; Cin=0; #10;   

        $finish;
    end

    initial begin
        $monitor("Time=%0t | A=%d B=%d Cin=%b => SUM=%d Cout=%b", $time, A, B, Cin, SUM, Cout);
    end

endmodule
