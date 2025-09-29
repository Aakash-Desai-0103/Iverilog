module dff(input clk, input reset, input d, output reg q);
    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module johnson_counter_3bit(input clk, input reset, output [2:0] q);
    wire [2:0] d;

    assign d[0] = ~q[2];
    assign d[1] = q[0];
    assign d[2] = q[1];

    dff dff0 (.clk(clk), .reset(reset), .d(d[0]), .q(q[0]));
    dff dff1 (.clk(clk), .reset(reset), .d(d[1]), .q(q[1]));
    dff dff2 (.clk(clk), .reset(reset), .d(d[2]), .q(q[2]));
endmodule
