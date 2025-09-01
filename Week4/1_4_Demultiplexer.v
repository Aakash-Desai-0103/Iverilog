module demux1to4(
    input wire i,          
    input wire [1:0] sel,   
    output wire y0, y1, y2, y3  
);
    assign y0 = (sel == 2'b00) ? i : 1'b0;
    assign y1 = (sel == 2'b01) ? i : 1'b0;
    assign y2 = (sel == 2'b10) ? i : 1'b0;
    assign y3 = (sel == 2'b11) ? i : 1'b0;
endmodule
