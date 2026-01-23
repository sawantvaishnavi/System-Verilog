module tb;
  
  reg clk = 0, rd = 0, rst = 0, ce = 0;
  always #5 clk = ~clk;
  
  reg [7:0] addr;
  integer i = 0;
  
    
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #100;
    $finish();
  end
  
initial begin
  rst = 1;
  #10;
  ce = 1;
  rst = 0;
  #30;
  rd =1;
  #20;
  rd = 0;
end
  
  initial begin
    for( i = 0 ; i < 5; i++) begin
      addr = $urandom();
      @(posedge clk);
      @(posedge clk);
    end
    
      for( i = 0 ; i < 5; i++) begin
      addr = $urandom();
      @(posedge clk);
    end
    
  end
  
//// add your code  here for property 1 and property 2
  
  A1: assert property (@(posedge clk) disable iff(rst) ce |-> $stable(rd)[*2] ) $info("Success at %0t", $time); else $error("fail at %0t", $time);
  
  A2: assert property (@(posedge clk) rd |-> $stable(addr)[*2]) $info("Success at %0t", $time); else $error("fail at %0t", $time);
endmodule
