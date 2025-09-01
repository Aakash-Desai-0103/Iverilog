module demux1to2(
    input wire i,       
    input wire sel,    
    output wire y0, y1 
);
    assign y0 = (sel == 0) ? i : 1'b0;
    assign y1 = (sel == 1) ? i : 1'b0;
endmodule
