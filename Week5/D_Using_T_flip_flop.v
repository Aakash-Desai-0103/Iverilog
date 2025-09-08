// ------------------------------
// T Flip-Flop Module
// ------------------------------
module t_ff(
    input wire t,
    input wire clk,
    input wire rst,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else if (t)
            q <= ~q;   // Toggle
        else
            q <= q;    // Hold
    end
endmodule

// ------------------------------
// D Flip-Flop Using T Flip-Flop
// ------------------------------
module d_ff_using_t(
    input wire d,
    input wire clk,
    input wire rst,
    output wire q
);
    wire t;

    // T input logic: T = D XOR Q
    assign t = d ^ q;

    // Instantiate T flip-flop
    t_ff uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q)
    );
endmodule
