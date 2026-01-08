
A1: assert property (@(posedge clk) (($fell(rst) && $rose(mode)) |=> (dout== ($past(dout) + 1)) )) $info ("Suc at %0t", $time); else $error("Fail at %0t", $time);
