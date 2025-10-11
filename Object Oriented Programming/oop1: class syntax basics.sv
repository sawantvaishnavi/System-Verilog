//class syntax - declaraion,  object, member, method, new constructor, object creation​
//Make a class student with name, roll_no, marks.

//A.Example – Without constructor

//class - just blueprint
class basics_of_oops;
  //properties
  string name;
  int roll_num;
  real marks = 0;         ///floating point num saved in real data type
    
  //methods
  function void display ();
    $display("Name = %s, Roll Num = %0d, Marks = %0f",name, roll_num,marks);
  endfunction
endclass  
  

//create an object -- Actual thing created from class  
module test ;
  
  initial begin
    basics_of_oops s1;  //Handler is created
    s1 = new ();        //Constructor is creted -- assigns memory   
    s1.name = "Vaishnavi";
    s1.roll_num = 17151122;
    s1.marks = 95;
    
    s1.display();       // Method call
  end
endmodule




//B.Example – With constructor
class basics_of_oops;
  
  string name;
  int roll_num;
  real marks;         
    

  function new(string n, int r, real m);
    name = n;
    roll_num = r;
    marks = m;  
  endfunction
  
  function void display ();
    $display("Name = %s, Roll Num = %0d, Marks = %0f",name, roll_num,marks);
  endfunction
  
endclass

module test;
  
  initial begin
  basics_of_oops s1;
  s1 = new ("Vaishnavi",17151122,95.0);
  s1.display();
  end
  
endmodule
  




//C.Example – With this keyword
//Use -- when local variable names might conflict with member variable names 
class basics_of_oops;
  
  string name;  //member variables
  int roll_num;
  real marks;         
    

  function new(string name, int roll_num, real marks); //local varible declared inside ()
    this.name = name;
    this.roll_num = roll_num;
    this.marks = marks;  
  endfunction
  
  function void display ();
    $display("Name = %s, Roll Num = %0d, Marks = %0f",name, roll_num,marks);
  endfunction
  
endclass

module test;
  
  initial begin
  basics_of_oops s1;
  s1 = new ("Vaishnavi",17151122,95.0);
  s1.display();
  end
  
endmodule
  
