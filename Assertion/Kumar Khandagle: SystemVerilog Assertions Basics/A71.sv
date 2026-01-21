A1: assert property (@(posedge clk) $fell(b) |-> (!b)[*3]) $info("Success at %0t",$time); else $error("Failed at %0t", $time);
