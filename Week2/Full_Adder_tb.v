module fulladder_tb; 
    reg aa, bb, cc; 
    wire ss, cy; 

  
    fulladder add1 ( .a(aa), .b(bb), .cin(cc), .sum(ss), .cout(cy) ); 

    initial begin
     
        #0  aa = 0; bb = 0; cc = 0; 
        #10 aa = 0; bb = 0; cc = 1; 
        #10 aa = 0; bb = 1; cc = 0; 
        #10 aa = 0; bb = 1; cc = 1; 
        #10 aa = 1; bb = 0; cc = 0; 
        #10 aa = 1; bb = 0; cc = 1; 
        #10 aa = 1; bb = 1; cc = 0; 
        #10 aa = 1; bb = 1; cc = 1; 
    end

    initial begin 
        $monitor($time, " a=%b, b=%b, cin=%b, sum=%b, carry=%b", aa, bb, cc, ss, cy); 
    end 

    initial begin 
        $dumpfile("fulladder.vcd"); 
        $dumpvars(0, fulladder_tb); 
    end 
endmodule
 
