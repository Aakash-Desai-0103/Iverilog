module t_ff (input wire T, input wire clk, input wire rst, output reg Q);


always @(posedge clk) begin
		Q = 1'b0;
	if (rst)
		Q <= 1'b0;   // toggle
	else if (T)
		Q <= ~Q;	//hold
	else
		Q <= Q;
end
endmodule