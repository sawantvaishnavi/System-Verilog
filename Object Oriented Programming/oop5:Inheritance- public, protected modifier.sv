//1.Public
class Car;
  string brand;
  int speed;

  function void display();
    $display("Brand: %s, Speed: %0d km/h", brand, speed);
  endfunction
endclass


class ElectricCar extends Car;   //  Inheritance keyword: extends
  int battery_capacity;

  function void show();
    $display("Battery: %0d kWh", battery_capacity);
  endfunction
endclass


module tb;
  initial begin
    ElectricCar e1 = new();
    e1.brand = "Tesla";           //  public → accessible from module
    e1.speed = 200;               //  public → accessible from module
    e1.battery_capacity = 100;    //  child variable → accessible

    e1.display();                 //  parent method
    e1.show();                    //  child method
  end
endmodule




//2.Protected
//You are NOT accessing variable directly . You are accessing it indirectly via a method
class Car;
  protected string brand;
  protected int speed;

  // Setter (to safely set values, since module can't access protected data)
  //This function is inside the class, So it has permission to access protected variables
  //👉 Module is NOT accessing brand 👉 Module is calling a function, and function is updating it
  function void set_details(string b, int s);
    brand = b;
    speed = s;
  endfunction

  function void display();
    $display("Brand: %s, Speed: %0d km/h", brand, speed);
  endfunction
endclass

class ElectricCar extends Car;
  int battery_capacity;

  function void show();
    //  can access brand, speed → because they are protected (and child class)
    $display("Brand: %s, Speed: %0d km/h, Battery: %0d kWh",
             brand, speed, battery_capacity);
  endfunction
endclass


module tb;
  initial begin
    ElectricCar e1 = new();

    //  e1.brand = "Tesla";  // ERROR: cannot access protected variable
    //  e1.speed = 200;      // ERROR: cannot access protected variable

    //  Instead, use parent’s function to set them
    e1.set_details("Tesla", 200);

    e1.battery_capacity = 100;  //  accessible (child variable)
    e1.show();                  //  shows everything
  end
endmodule



///3. Local
class Car;
  local string brand;
  local int speed;

  function void set_details(string b, int s);
    brand = b;
    speed = s;
  endfunction

  function void display();
    $display("Brand: %s, Speed: %0d km/h", brand, speed);
  endfunction
endclass


class ElectricCar extends Car;
  int battery_capacity;

  function void set_battery(int b);
    battery_capacity = b;
  endfunction

  function void show();
    //  NOT allowed (will cause error if uncommented)
    // $display("Brand: %s, Speed: %0d", brand, speed);

    $display("Battery: %0d kWh", battery_capacity);
  endfunction
endclass


module tb;
  initial begin
    ElectricCar e1 = new();

    //  Not allowed
    // e1.brand = "Tesla";
    // e1.speed = 200;

    //  Only way to set values
    e1.set_details("Tesla", 200);
    e1.set_battery(100);

    e1.display(); // parent method → allowed
    e1.show();    // child method → allowed
  end
endmodule
