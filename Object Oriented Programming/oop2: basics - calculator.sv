//Create a class calculator with a and b as 8-bit numbers.
//Write methods to perform add, sub, mul, div. Display results

class calculator ;
  bit [7:0]  a;
  bit [7:0]  b;
  bit [8:0] add;
  bit [7:0] diff;
  bit [15:0] mul;
  real div;
  
  function new ( bit [7:0]  a, bit [7:0]  b);
    this.a = a;
    this.b = b;
    
    add = a + b;
    diff = a - b;
    mul = a * b ;
    div = a / b;
    
  endfunction
  
  function void display();
    $display("a=%0d, b=%0d", a, b);
    $display("Addition is:%0d | Substraction:%0d | Multiplication:%0d | Division:%0f",add,diff,mul,div);
  endfunction
endclass


module tb;
  initial begin
    calculator c;
    c = new (8'b00001000, 8'b00000010);
    c.display();
  end
endmodule
