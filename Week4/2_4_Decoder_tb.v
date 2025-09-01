
module TB;
  reg [1:0] A;
  reg EN;
  wire [3:0] Y;

  
  dec2to4 newDEC (
    .a(A),
    .en(EN),
    .y(Y)
  );

  initial begin
    $dumpfile("DEC2_test.vcd");
    $dumpvars(0, TB);
    $monitor("Time=%0t | EN=%b | A=%b | Y=%b", $time, EN, A, Y);

 
    EN = 1'b0; A = 2'b00; #5;
    EN = 1'b1; A = 2'b00; #5;
    EN = 1'b1; A = 2'b01; #5;
    EN = 1'b1; A = 2'b10; #5;
    EN = 1'b1; A = 2'b11; #5;
    EN = 1'b0; A = 2'b10; #5;

    $finish; 
  end
endmodule