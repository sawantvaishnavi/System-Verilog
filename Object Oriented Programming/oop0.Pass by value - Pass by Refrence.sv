//Pass by value sends a copy of the variable, while pass by reference uses the original variable, so any modification affects the caller

//1.Pass by value
module tb();
  
  task pass_by_value( int x);
    x = x +10;
    $display("Inside task x=%0d", x);
  endtask
  
  initial begin
    int a=5;
    pass_by_value(a);  //copy of a is send to x
    $display("Outside task a=%0d", a);
  end
endmodule

//2.pass by ref
module tb();
  
  task pass_by_value( ref int x);
    x = x +10;
    $display("Inside task x=%0d", x);
  endtask
  
  initial begin
    int a=5;
    pass_by_value(a);  //copy of a is send to x
    $display("Outside task a=%0d", a);
  end
endmodule
