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
class Car;
  protected string brand;
  protected int speed;

  // Setter (to safely set values, since module can't access protected data)
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
