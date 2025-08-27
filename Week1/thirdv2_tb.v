module simple_circuit_tb;
    reg A, B, C;
    wire D, E;
    simple_circuit M1 (A, B, C, D, E);
    initial begin
        A = 0; B = 0; C = 0;
        #20 A = 0; B = 0; C = 1;
        #20 A = 0; B = 1; C = 0;
        #20 A = 0; B = 1; C = 1;
        #20 A = 1; B = 0; C = 0;
        #20 A = 1; B = 0; C = 1;
        #20 A = 1; B = 1; C = 0;
        #20 A = 1; B = 1; C = 1;
        #20 $finish;
    end
    initial begin
        $monitor($time, "A = %b, B = %b, C = %b, D = %b, E = %b", A, B, C, D, E);
    end
    initial begin
        $dumpfile("s1.vcd");
        $dumpvars(0, simple_circuit_tb);
    end
endmodule