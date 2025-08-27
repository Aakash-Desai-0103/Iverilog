module circuit2_tb;
    reg A2, B2, C2;
    wire Z;
    circuit2 uut(Z, A2, B2, C2);  

    initial begin
        
        A2 = 0; B2 = 0; C2 = 0;
        #20 A2 = 0; B2 = 0; C2 = 1;
        #20 A2 = 0; B2 = 1; C2 = 0;
        #20 A2 = 0; B2 = 1; C2 = 1;
        #20 A2 = 1; B2 = 0; C2 = 0;
        #20 A2 = 1; B2 = 0; C2 = 1;
        #20 A2 = 1; B2 = 1; C2 = 0;
        #20 A2 = 1; B2 = 1; C2 = 1;
        #20 $finish;
    end

    initial begin
        $monitor("%0t: A2=%b B2=%b C2=%b Z=%b", $time, A2, B2, C2, Z);
    end

    initial begin
        $dumpfile("circuit2_tb.vcd");
        $dumpvars(0, circuit2_tb);
    end
endmodule
