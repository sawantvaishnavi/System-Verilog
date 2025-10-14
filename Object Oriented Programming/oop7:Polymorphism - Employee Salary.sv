//Using polymorphism: 
//Class employee (base) → derived classes manager, engineer.
//Override calc_salary() based on position.


// Base Class
class employee;
  protected string name;
  protected int id;
  protected int base_salary;
  protected int salary;
  
  function void set_details(string n, int i, int b);
    name = n;
    id = i;
    base_salary = b;
  endfunction

  // Virtual methods for polymorphism
  virtual function void cal_salary();
    salary = base_salary;
  endfunction
  
  virtual function void show();
    $display("Name: %s | ID: %0d | Salary: %0d", name, id, salary);
  endfunction
endclass


// Derived Class 1: Manager
class manager extends employee;
  int bonus;
  
  function void set_bonus(int b);
    bonus = b;
  endfunction
  
  function void cal_salary();
    salary = base_salary + bonus;
  endfunction
  
  function void show();
    $display("[Manager] Name: %s | ID: %0d | Total Salary: %0d", name, id, salary);
  endfunction
endclass


// Derived Class 2: Engineer
class engineer extends employee;
  int project_allowance;
  
  function void set_allowance(int a);
    project_allowance = a;
  endfunction
  
  function void cal_salary();
    salary = base_salary + project_allowance;
  endfunction
  
  function void show();
    $display("[Engineer] Name: %s | ID: %0d | Total Salary: %0d", name, id, salary);
  endfunction
endclass


// Derived Class 3: Intern
class intern extends employee;
  int stipend;
  
  function void set_stipend(int s);
    stipend = s;
  endfunction
  
  function void cal_salary();
    salary = stipend;
  endfunction
  
  function void show();
    $display("[Intern] Name: %s | ID: %0d | Stipend: %0d", name, id, salary);
  endfunction
endclass


// Testbench
module tb;
  employee e; // Common base handle
  manager m;
  engineer eng;
  intern i;
  
  initial begin
    // Manager
    e = new();              // create base class handle
    m = new();              // create derived object
    e = m;                  // assign to base class handle
    e.set_details("Ram", 101, 100000);
    m.set_bonus(45000);
    e.cal_salary();         // calls manager::cal_salary()
    e.show();               // calls manager::show()

    // Engineer
    e = new();
    eng = new();
    e = eng;
    e.set_details("Bijoy", 102, 20000);
    eng.set_allowance(12000);
    e.cal_salary();         // calls engineer::cal_salary()
    e.show();               // calls engineer::show()

    // Intern
    e = new();
    i = new();
    e = i;
    e.set_details("Dili", 103, 0);
    i.set_stipend(15000);
    e.cal_salary();         // calls intern::cal_salary()
    e.show();               // calls intern::show()
  end
endmodule
