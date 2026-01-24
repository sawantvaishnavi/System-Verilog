//////////Delay operator//////////

1.If signal a is high, then signal b must be high exactly 2 clock cycles later.
A1: assert property (@(posedge clk) a |-> ##2 b ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);

2.Whenever req rises, grant must be asserted in the very next clock cycle.
A1: assert property (@(posedge clk) $rose(req) |=> grant ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);
  
3.If start is asserted, then done must go high between 2 and 5 clock cycles later (inclusive).
A1: assert property (@(posedge clk) start |-> ##[2:5] done ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);

4.When enable rises, signal ready must be asserted within 1 to 3 clock cycles.
A1: assert property (@(posedge clk) $rose(enable) |-> ##[1:3] ready ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);



//////////Repetition Operator//////////
  
5.If valid is asserted, then busy must stay high for exactly 3 consecutive clock cycles.
A1: assert property (@(posedge clk) valid |-> busy[*3] ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);
  
6.When start goes high, signal work must remain high for at least 2 consecutive clock cycles.
A1: assert property (@(posedge clk) $rose(start) |-> work[*2:$] ) $info("Success at %0t", $time); else $error("Fail at %0t", $time); 

7.If req rises, then ack must stay high for 3 to 5 consecutive clock cycles.
A1: assert property (@(posedge clk) $rose(req) |-> ack[*3:5] ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);
  
8.If a rises, then • b must be high for 2 consecutive clock cycles, • followed by c being high 1 clock cycle later.
A1: assert property (@(posedge clk) $rose(a) |-> b[*2]  ##1 c) $info("Success at %0t", $time); else $error("Fail at %0t", $time);


//////////Mix Question//////////
  
9. If start occurs, then busy must stay high continuously until done occurs, and done must happen within 5 clock cycles. 
A1: assert property (@(posedge clk) $rose(start) |-> busy until_with ##[1:5] done ) $info("Success at %0t", $time); else $error("Fail at %0t", $time);
















  
