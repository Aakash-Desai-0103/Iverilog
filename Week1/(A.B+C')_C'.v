`timescale 1ns/1ps

module simple_circuit
(
    input  wire A,
    input  wire B,
    input  wire C,
    output wire D,
    output wire E
);
    wire w1;
    and G1(w1, A, B);
    not G2(E, C);     
    or  G3(D, w1, E);  
endmodule
