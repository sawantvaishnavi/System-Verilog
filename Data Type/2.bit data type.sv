/* 1.Initial value of "bit" data type is 0
	2.If a "bit" type variable is assigned with a value greater than it can hold
	the left most bits are truncated.*/

module tb();
  bit [3:0] data_in;
  
  initial begin
    $display("At the time = %0t ,data_in = 0x%0h", $time, data_in);  //Initial value of "bit" data type is 0
    
    #10 data_in = 4'hA;
    $display("At the time = %0t ,data_in = 0x%0h", $time, data_in);
    
    #20 data_in = 'h3AB7;
    $display("At the time = %0t ,data_in = 0x%0h", $time, data_in); //truncation 
    
  end
 

  initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #200;
  $finish;
   end
endmodule
