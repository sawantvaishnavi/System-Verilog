//The super keyword refers to the parent class (also called base class) from which the current class (child/derived class) is inherited.

//It’s mainly used inside a child class to: 1.Call the parent class constructor   2.Access parent class methods or variables that are hidden or overridden by the child class.


//1.Calling the Parent Constructor
class Parent;
  int a;
  
  function new(int a);
    this.a = a;
    $display("Parent constructor called, a = %0d", a);
  endfunction
endclass


class Child extends Parent;
  int b;

  function new(int a, int b);
    super.new(a); // Call Parent constructor
    this.b = b;
    $display("Child constructor called, b = %0d", b);
  endfunction
endclass


module top;
  initial begin
    Child c = new(10, 20);
  end
endmodule




//2.Calling Parent Methods
class Parent;
  function void display();
    $display("Display from Parent class");
  endfunction
endclass


class Child extends Parent;
  function void display();
    $display("Display from Child class");
    super.display(); // explicitly call parent’s version
  endfunction
endclass


module top;
  initial begin
    Child c = new();
    c.display();
  end
endmodule


//or 
class Parent;
  int a;
  
  function new(int a);
    this.a = a;
    $display("Parent constructor called, a = %0d", a);
  endfunction
endclass


class Child extends Parent;
  int b;

  function new(int a, int b);
    super.new(a); // Call Parent constructor
    this.b = b;
    $display("Child constructor called, b = %0d", b);
  endfunction
endclass


module top;
  initial begin
    Child c = new(10, 20);
  end
endmodule

