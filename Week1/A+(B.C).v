module circuit1 (y, a, b, c);
	input a, b, c;
    	output y;
    	wire w1;
    	and (w1, b, c);   
    	or  (y, a, w1); 
endmodule
