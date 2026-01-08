module tb;
  
  reg a = 0, clk = 0,b = 0;
  always #5 clk = ~clk;
  
  
    
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
initial begin
  #20;
a = 0;
  #10;
a = 1;
b = 1;
#10;
  b = 0;
  a = 0;
 
  
end
  
///add your code here
  A1: assert property (@(posedge clk) ($rose(a) |-> $rose(b))) $info ("Suc at %0t", $time); else $error("Fail at %0t", $time);
endmodule
