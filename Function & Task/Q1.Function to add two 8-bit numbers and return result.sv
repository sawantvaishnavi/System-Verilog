//1.
module tb();
  
  function bit [8:0] add(input bit [7:0] x, input bit [7:0] y);
   return x + y;
  endfunction
  
  
  bit [8:0] sum;
  
  initial begin
    sum = add(8,7);
    $display("sum is: %0d", sum);
  end
  
endmodule



//2.
module tb();
  
  function bit [8:0] add(input bit [7:0] x, input bit [7:0] y);
    add = x +y ;         /// here add here is not a variable you declared — it’s actually the name of the function itself.
//In SystemVerilog, the function name acts as an implicit variable of the same data type as the function’s return type.
    
    $display("sum is: %0d", add);
  endfunction
  
  
  bit [8:0] sum;
  
  initial begin
    sum = add(5,7);
    
  end
  
endmodule




//3.
module tb();
  
  function bit [8:0] add(input bit [7:0] x, input bit [7:0] y);
   return x + y;
  endfunction
  
  
  bit [8:0] sum;
  
  initial begin
    bit [7:0] x = 8;
    bit [7:0] y = 7;
    sum = add(x,y);
    
    $display("sum is: %0d", sum);
  end
  
endmodule

