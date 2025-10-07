//A. Pass by Value
module tb();
  task pass_by_value(input int a);
     a = a + 10;   // modifies only the local copy
     $display("Inside task: a = %0d", a);
  endtask

  initial begin
    int x = 5;
    pass_by_value(x);
    $display("Outside task: x = %0d", x);
  end

endmodule


//B.Pass by ref
module tb;
  task pass_by_ref(ref int a);    
    a = a + 10;  // modifies original variable directly
    $display("Inside task: a = %0d", a);
  endtask

  initial begin    
    int x = 5;
    pass_by_ref(x);
    $display("Outside task: x = %0d", x);
  end
  
endmodule
