module tb_dff;
    reg D;
    reg CLK;
    reg RST;
    wire Q;
    
    // Instantiate D flip-flop
    dff newD(.D(D), .clk(CLK), .rst(RST), .Q(Q));
    
    // Clock generation
    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;  // 10 time units period
    end
    
    // Waveform dump for GTKWave
    initial begin
        $dumpfile("dff.vcd");
        $dumpvars(0, tb_dff);
    end
    
    // Stimulus
    initial begin 
        RST = 1'b1; D = 1'b0; #9;
        RST = 1'b0;             #6;
        
        D = 1'b1; #7;
        D = 1'b0; #9;
        D = 1'b1; #11;
        D = 1'b0; #6;
        
        // Apply reset again
        RST = 1'b1; #5; RST = 1'b0; #15;
        
        D = 1'b1; #12;
        D = 1'b0; #8;
        
        $finish;
    end
    
    // Safety guard
    initial begin
        #200 $finish;
    end
    
    // Monitor output
    initial begin
        $display("Time\tRST\tCLK\tD\tQ");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, RST, CLK, D, Q);
    end

endmodule
