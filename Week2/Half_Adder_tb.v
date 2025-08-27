module halfadd_tb; 
    reg a, b; 
    wire sum1, count; 
    halfadd ha1 ( sum1, count, a, b ); 
    initial begin
	$monitor($time,"a=%b,b=%b,sum1=%b,count=%b",a,b,sum1,count);
        #0 a=0;b=0;
        #10 a=0;b=1;
        #10 a=1;b=0;
        #10 a=1;b=1;
	#10 a=0;b=0;
   
    end
    initial begin 
        $dumpfile("halfadd_test.vcd"); 
        $dumpvars(0, halfadd_tb); 
    end 
endmodule
