A1: assert property (@(posedge clk) $rose(ce) |-> ##[5:10] $fell(ce) ) $info ("Sucess at %0t", $time); else $error("Fail at %0t", $time);
