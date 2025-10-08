`include "test.sv"
`timescale 1ns/1ps
module tb;

  reg clk1 ;   // 100 MHz clock signal
  reg clk2 ;   // 50 MHz clock signal

  // User Clock generation logic start here
  initial begin
    clk1 = 1'b0;
    clk2 = 1'b0;
  end
  
  always #5 clk1 = ~clk1;
  always #10 clk2 = ~clk2;
  ////// User clock generation logic ends here


  // Instantiate the test class
  test t1 = new();

  initial begin
    #80;   // Sample clocks at 80 ns
    t1.no_gen(clk1, clk2);
    t1.display();
    $stop;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
  
endmodule
