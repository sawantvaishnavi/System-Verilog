//Understanding type of assertion and clock edges

//understanding Format of concurrent Assertion:

module tb;
  
  reg clk = 0;
  
  reg temp = 0;
  reg a = 0;
  
  always #10 clk = ~clk;
  always #30 a = ~a;
  
  initial begin
    temp = 1'b1;
    @(posedge clk);
    temp = 1'b0;
  end
  
  //time 30 is ignored where both posedge and a=1 is there--> this is because of event scheduling
  A1:  assert property (@ (posedge clk) (a==1'b1)) $info("A1 Success @ %0t", $time); else $error("A1 Fail @ %0t", $time);
    
  
  // time 60 is ignored where both negedge and a=0 is there--> this is because of event scheduling
 A2:  assert property (@(negedge clk) (a==1'b0)) $info("A2 Sucess @ %0t", $time); else $error("A2 Fail @ %0t", $time);
    
  //any edge : time 30, 60, 90 is ignored
  //if answer is doesnot changed in next clock then that answer is suprressed by the compiler, for ex. time 20, at time 10 we got answer failed but at 20 also it is failing but it just showing answer in log for time 10
 A3: assert property (@(edge clk) (a == 1'b1)) $info("A3 Sucess @ %0t", $time); else $error("A3 Fail @ %0t", $time);
  
  //Run only once
 initial A4: assert property (@(negedge clk) (a==1'b0) ) $info("A4 Sucess @ %0t", $time); else $error("A2 Fail @ %0t", $time);
   
  A5: assert property (@(posedge clk) $rose(temp) |-> (a==1'b1)) $info("A5 sucess @ %0t", $time); else $error("A5 Fail @ %0t", $time);
  
    
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    $assertvacuousoff(0);
    #100;
    $finish;
  end
endmodule
  
  
