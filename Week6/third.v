module jkff(input clk, input reset, input j, input k, output reg q);
    always @(posedge clk) begin
        if (reset) 
            q <= 1'b0;       // synchronous reset
        else begin
            case ({j,k})
                2'b00: q <= q;        // no change
                2'b01: q <= 1'b0;     // reset
                2'b10: q <= 1'b1;     // set
                2'b11: q <= ~q;       // toggle
            endcase
        end
    end
endmodule

module up_down_counter_2bit(input clk, input reset, input up_down, output [1:0] q);
    wire j0, k0, j1, k1;

    // LSB always toggles
    assign j0 = 1'b1;
    assign k0 = 1'b1;

    // MSB toggles condition depends on up_down
    // For UP   -> toggle when q[0] = 1
    // For DOWN -> toggle when q[0] = 0
    assign j1 = (up_down) ? q[0] : ~q[0];
    assign k1 = (up_down) ? q[0] : ~q[0];

    // instantiate two JK flip-flops
    jkff jkff0 (.clk(clk), .reset(reset), .j(j0), .k(k0), .q(q[0]));
    jkff jkff1 (.clk(clk), .reset(reset), .j(j1), .k(k1), .q(q[1]));
endmodule
