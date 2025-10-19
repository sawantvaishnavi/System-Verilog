module tb;
  
  task T1;
    forever begin
      $display("Task 1 Started %0t", $time);
      #20;
      $display("Task 1 Completed %0t", $time);     
    end
  endtask
  
  task T2;
    forever begin
      $display("Task 2 Started %0t", $time);
      #30;
      $display("Task 2 Completed %0t", $time);
    end
  endtask
  
  task T3;
    $display("Reached next to Join at %0t",$time);
  endtask
  
  initial begin  
    fork
      T1 ();
      T2 ();
    join_none

      T3 ;
      end
  
  initial begin
    #200 $finish;
  end
  
endmodule
