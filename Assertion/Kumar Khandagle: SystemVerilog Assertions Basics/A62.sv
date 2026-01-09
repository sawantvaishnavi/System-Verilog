A1:assert property (@(posedge clk) ($rose(a) |=> $fell(a))) $info("A1 Success at %0t", $time); else $error ("A1 Failed at %0t", $time);
