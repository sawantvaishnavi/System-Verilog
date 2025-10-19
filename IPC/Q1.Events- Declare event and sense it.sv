module tb;
  
  event a1, a2;
  
  initial begin
    -> a1;
    -> a2;
  end
  
  initial begin   
    wait (a1.triggered);
    $display("event a1 is sensed");
    wait (a2.triggered);
    $display("event a2 is sensed");
  end
  
endmodule
