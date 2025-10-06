module alu (input wire [1:0] op, input wire [15:0] i0, i1,
    output reg [15:0] o, output reg cout);
    always @(*) begin
        case (op)
            2'b00: {cout, o} = i0 + i1;
            2'b01: begin
                o = i0 & i1;
                cout = 1'b0;
            end
            2'b10: begin
                o = i0 | i1;
                cout = 1'b0;
            end
            2'b11: begin
                o = i0 ^ i1;
                cout = 1'b0;
            end


            default: begin
                o = 16'b0;
                cout = 1'b0;
            end
        endcase
    end

endmodule