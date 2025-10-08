`include "test.sv"


module tb;
  
  reg resetn = 0;   //////rst represent DUT reset Signal

  /////// User Logic goes here
  reg clk = 0;
  
  initial begin 
    resetn = 1'b0;
    #100;
    resetn = 1'b1;
  end
  
  initial begin 
    #50 resetn = ~resetn;
  end

  
  
  
  
  /////// User code ends here
 
  
  test t1 = new();
  
  initial begin
    #201;
    t1.no_gen(resetn);
    t1.display();
  end
  
  
endmodule
