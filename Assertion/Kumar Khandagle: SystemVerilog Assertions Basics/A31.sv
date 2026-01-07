module tb;
  reg a = 0, b = 1;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  //always #2 en = ~en;
  
  initial begin
    a = 1;
    #7;
    a = 0;
    #30;
    a = 1; 
    #30;
    a = 1;
  end
  
    initial begin
    b = 1;
    #7;
    b = 0;
    #10;
    b = 1; 
    #30;
    b = 1;
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
 
///Add your code here
  
  A1: assert property (@(edge clk) (a==b)) $info("A1 Sucess at %0t", $time); else $error("A1 Fail at %0t", $time);
                              
endmodule
