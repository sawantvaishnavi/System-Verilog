
A1: assert property (@(posedge clk) ($rose(rst) |-> !ce )) $info ("Suc at %0t", $time); else $error("Fail at %0t", $time);
