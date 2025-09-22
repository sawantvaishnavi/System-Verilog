/* time - used for fixed point time value
realtime - used for floating point time value

rounding technique: 12.33 --> 12 
                    12.57 --> 13   */

`timescale 1ns/1ps
/// 3point precision is there
module tb();
  
  time fix_time = 0;
  
  initial begin
    #17.45;
    $display("Current simulation time is %0t", $time); // due to precision simulation time is 17000ps which is 17ps. here rounding is used
    
  
    $display("Current simulation time is %0t", $realtime); //17450 ps as we are using realtime to showcase floating point value.
    
  end
endmodule
