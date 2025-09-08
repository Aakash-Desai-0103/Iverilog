module dff (
    input wire D,
    input wire clk,
    input wire rst,
    output reg Q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0; // Asynchronous reset
        else
            Q <= D;    // Capture D on rising edge of clock
    end
endmodule
