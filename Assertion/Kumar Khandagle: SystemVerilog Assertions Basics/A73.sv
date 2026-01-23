A1: assert property (@(posedge clk) $rose(ce) |-> ##1 ce[*7]  ) $info ("Sucess at %0t", $time); else $error("Fail at %0t", $time);
