//// Method 1: Shallow Copy ////
//// em1 and em2 are pointing to same object memory i.e this.salary   --> shallow copy - em2= em1

class employee;
  int id;
  string name;
  real salary;
  
  ///using constructor to initilize all variables
  function new (int id , string name, real salary);
    this.id = id;
    this.name = name;
    this.salary = salary;
  endfunction
  
  function void display ();
    $display("id=%0d, name=%0s, real=%0f", this.id, this.name, this.salary);
  endfunction
  
  function void raise_salary (real percent);
    this.salary = this.salary + (this.salary * percent/100);
    $display("new salary=%0f", salary);
  endfunction
  
endclass

module tb;
  initial begin
    employee em1;
    employee em2;
    
    em1 = new (12 , "Vai" , 100);
	em1.display();
    em1.raise_salary (10);
    
    em2 = em1;
    em1.raise_salary (10);
    em1.display();
    em2.display();
  end
endmodule


/// Method 2: Deep Copy ///
// crete separte copy function --> deep copy

class employee;
  int id;
  string name;
  real salary;
  
  ///using constructor to initilize all variables
  function new (int id , string name, real salary);
    this.id = id;
    this.name = name;
    this.salary = salary;
  endfunction
  
  function employee copy();
    copy = new (this.id, this.name, this.salary);
  endfunction
    
  function void display ();
    $display("id=%0d, name=%0s, real=%0f", this.id, this.name, this.salary);
  endfunction
  
  function void raise_salary (real percent);
    this.salary = this.salary + (this.salary * percent/100);
    $display("new salary=%0f", salary);
  endfunction
  
endclass

module tb;
  initial begin
    employee em1;
    employee em2;
    
    em1 = new (12 , "Vai" , 100);
	em1.display();
    em1.raise_salary (10);
    
    em2 = em1.copy();  //deep copy
    em1.raise_salary (10);
    em1.display();
    em2.display();
  end
endmodule
