//Class employee (base) → derived classes manager, engineer.
//Override calc_salary() based on position.


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

  function void cal_salary();
    salary = base_salary;
  endfunction
endclass

class manager extends employee;
  function void set_salary1(int bonus);
    salary = base_salary + bonus;
  endfunction

  function void show1();
    $display("Name: %s, ID: %0d, Total salary: %0d", name, id, salary);
  endfunction
endclass

class engineer extends employee;
  function void set_salary2(int project_allowance);
    salary = base_salary + project_allowance;
  endfunction

  function void show2();
    $display("Name: %s, ID: %0d, Total salary: %0d", name, id, salary);
  endfunction
endclass

class intern extends employee;
  function void set_salary3(int stipend);
    salary = stipend;
  endfunction

  function void show3();
    $display("Name: %s, ID: %0d, Total salary: %0d", name, id, salary);
  endfunction
endclass

module tb;
  initial begin
    manager m1 ;   //handler is created from child class
    engineer e1;
    intern i1;
    
    m1 = new();
    m1.set_details("Ram", 101, 100078);
    m1.set_salary1(45650);
    m1.show1();

    e1 = new();
    e1.set_details("Bijoy", 102, 20500);
    e1.set_salary2(6700);
    e1.show2();

    i1 = new();
    i1.set_details("Dili", 103, 0);
    i1.set_salary3(5000);
    i1.show3();
  end
endmodule
