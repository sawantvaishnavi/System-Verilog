/*logic is hardware data type. it has 4 states and it can be user defined bit size (>=1 bit).
Logic data type can drive both procedural blocks(initial or always) and continuous assign statements (assign).
Immediately after assignment, data_in2 hasn’t updated yet.
After advancing time, en reflects the new value of data_in1[0]. */

module tb;
  
  logic [3:0] data_in1;   //4 bit
  logic data_in2;         //1 bit
  
  
  logic clk =0;
  
  
 initial begin
   
   $display ("data_in1=0x%0h, data_in2=%b", data_in1, data_in2);    // Default value of logic type is X
   
   data_in1 = 4'hA;
      $display ("data_in1=0x%0h, data_in2=%b", data_in1, data_in2); 
   
   #1; //assign statement takes time to reflect value 
   $display ("data_in1=0x%0h, data_in2=%b", data_in1, data_in2); 
   
 end
  
  assign data_in2 = data_in1[0];
  
  always #10 clk = ~clk;
  

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #200; 
    $finish;
  end
endmodule
