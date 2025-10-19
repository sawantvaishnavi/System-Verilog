module tb;
  
  bit [3:0] data_gen;
  event start;
  event stop;
  
  initial begin
    #20 -> start;
    #100 -> stop;
  end
  
  
  initial begin
    wait(start.triggered)
    for (int i=0; i<15; i++) begin
    data_gen = $urandom_range (0, 15);
      $display("Time [%0t] Data generated [%0d] Times: %0d ",$time,i ,data_gen);
      #10;
   
    
    if(stop.triggered) begin
      $display("Stop detected at %0t, exiting loop.", $time);
      break;
    end
   end
  end
  
  
  initial begin
    #200 $finish;
  end
endmodule


