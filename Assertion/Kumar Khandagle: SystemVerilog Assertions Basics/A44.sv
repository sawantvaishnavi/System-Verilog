A1: assert property(@(posedge clk) req |=> ack) $info("A1 Sucess at %0t", $time); else $error("A1 Failed at %0t", $time);
