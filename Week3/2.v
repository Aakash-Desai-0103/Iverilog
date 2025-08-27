module bcd_adder(
    input  [3:0] A, B,
    input  Cin,
    output [3:0] SUM,
    output Cout
);

    wire [4:0] temp;
    wire [4:0] corrected;

    
    assign temp = A + B + Cin;

    
    assign corrected = (temp > 9) ? (temp + 5'd6) : temp;

    assign SUM  = corrected[3:0];
    assign Cout = corrected[4];

endmodule
