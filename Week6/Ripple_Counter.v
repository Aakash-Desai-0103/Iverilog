module dff_async_reset(
    input clk,
    input reset,
    input d,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0; // Resets output to 0 immediately
        else
            q <= d;
    end
endmodule


module ripple_up_counter_2bit(
    input clk,
    input reset,
    output [1:0] q
);
    wire nq0; 
    assign nq0 = ~q[0];
    dff_async_reset dff0 (
        .clk(clk),
        .reset(reset),
        .d(~q[0]), // Connect D to ~Q to make it toggle
        .q(q[0])
    );

    dff_async_reset dff1 (
        .clk(nq0),       // <-- The clock ripples from the previous stage
        .reset(reset),   // <-- **CRITICAL FIX**: Reset is connected here too
        .d(~q[1]),       // Connect D to ~Q to make it toggle
        .q(q[1])
    );
endmodule
