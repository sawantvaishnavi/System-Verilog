module tb;
 reg a = 1;
 reg clk = 0;
 
 
 
 always #5 clk = ~clk;
 
 always #5 a = ~a;
 
 
//  always @(posedge clk)
//  begin
//  $info("Value of a :%b and $sampled(a) :%b ", a, $sampled(a)); 
//  end
 
  assert property (@(posedge clk ) (a == $sampled(a))) $info("Success at %0t with a : %0b",$time, $sampled(a));
 
 initial begin
 $dumpfile("dump.vcd"); 
 $dumpvars;
 $assertvacuousoff(0);
 #50;
 $finish();
 end
endmodule
