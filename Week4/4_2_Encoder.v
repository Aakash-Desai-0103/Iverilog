module enc4to2(
    input wire [3:0] d, 
    input wire en,     
    output wire [1:0] y, 
    output wire valid     
);

    assign y[1] = en & (d[3] | d[2]); 
    assign y[0] = en & (d[3] | d[1]);
    assign valid = en & (d[3] | d[2] | d[1] | d[0]);

endmodule
