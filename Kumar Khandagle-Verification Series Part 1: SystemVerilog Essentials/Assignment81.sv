module tb;
  
  int cnt1 = 0;
  int cnt2 = 0;
  
  
  task Task1 ();
    forever begin
      #20;
      $display("Task 1 Trigger");
      cnt1 ++ ;
    end
  endtask
  
  task Task2 ();
    forever begin
      #40;
      $display("Task 2 Trigger");
      cnt2 ++ ;
    end
  endtask
  
  
  initial begin
    fork
      Task1();
      Task2();
    join_none
    
    #200;
    
    $display("Task1 executed %0d Times", cnt1);
    $display("Task2 executed %0d Times", cnt2);
    $finish;
  end
  
endmodule
