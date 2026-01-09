module tb;
  reg rd = 0;
  reg rst = 1;
  reg clk = 0;
  
  always #5 clk = ~clk;
  
  initial begin
    #40;
    rst = 0;
    rd = 1;
    #20;
    rd = 0;
  end
 
 
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
 
 ////add your assertion statement here
  
A1: assert property (
  @(posedge clk)
  disable iff (rst)
  $fell(rst) |-> rd ##1 rd
)
  $info("A1 PASS: rd high for 2 cycles after reset deassertion at %0t", $time);
else
  $error("A1 FAIL: rd not high for 2 cycles after reset deassertion at %0t", $time);

                                                                                     
endmodule
