module mux2(
    input wire i0,
    input wire i1,
    input wire j,
    output wire o
);
    assign o = (j == 0) ? i0 : i1;
endmodule
