//1. Using Two different class
class driver_A;
  
  rand int data;
  semaphore sem;
  
  constraint c_data {data > 0; data <10;}
  
  task run ();
    $display("Driver_A is Waiting For bus Access..");
    sem.get(1);
    $display("Got bus Access for Driver_A !!");
    
    for(int i=0; i<5; i++) begin
      if(randomize()) begin
        $display("At %0t Sending Data=%0d",$time, data);
        #10;
      end
    end
    
    sem.put(1);
    $display("Semaphore is released..");
    
  endtask
  
endclass


class driver_B;
  
  rand int data;
  semaphore sem;
  
  constraint c_data {data > 10; data <20;}
  
  task run ();
    $display(" Driver_b is Waiting For bus Access..");
    sem.get(1);
    $display("Got bus Access for Driver_A !!");
    
    for(int i=0; i<5; i++) begin
      if(randomize()) begin
        $display("At %0t Sending Data=%0d",$time, data);
        #10;
      end
    end
    
    sem.put(1);
    $display("Semaphore is released..");
    
  endtask
  
endclass





module tb();
  semaphore bus_sem;
  
  driver_A  dA;
  driver_B  dB;
  
  initial begin
    
    // Create semaphore with 1 key (only one driver can access at a time)
    bus_sem = new(1); 
    
    dA =  new();
    dB = new();
    
   // Connect same semaphore handle to both drivers 
    dA.sem = bus_sem;
    dB.sem = bus_sem;
    
    fork
      dA.run();
      dB.run();
    join
    
    $display("[%0t] Simulation completed.", $time);
    $finish;
    
  end
  
endmodule


//2.Using one class

class driver;
  
  randc int data;
  string name;
  semaphore sem;
  
  constraint c_data {data inside {[3:12]}; }
  
  function new (string name, semaphore sem);
    this.name = name;
    this.sem = sem;
  endfunction
    
    task run();
      $display("[%0t] %s is waiting for Access...", $time, name);
      
      sem.get(1);
      for(int i=0; i<5; i++) begin
        assert (randomize());
        $display("[%0t] %s sending data %0d", $time, name, data);
        #10;
      end
      
      sem.put(1);
      $display("[%0t] %s Release access", $time, name);
    endtask
    
endclass
    
    
module tb;
  
  semaphore sema; 
  driver dA, dB;
  
  initial begin
    sema = new(1);
    
    // Create driver objects
    dA = new("Driver_A", sema);
    dB = new("Driver_b", sema);

  
  fork
    dA.run();
    dB.run();
  join
  
  $display("[%0t] Simulation completed.", $time);
  $finish;
  end
endmodule


//3.Two independent classes, both trying to access a shared resource (a “bus” or “data channel”) through a semaphore in the main controller.


class first; 
  
  randc int data;
  constraint c_data {data inside {[1:9]};}
  
endclass

class second;
  
  randc int data;
  constraint c_data {data inside {[10:20]};}
  
endclass

//class main act as controller
class main;
  
  semaphore sem;
  
  first f;
  second s;
  
  int data;
  
  task send_first ();
    sem.get(1);
    $display("Access is got to first task..");
    
    for (int i=0;i<5;i++) begin
      f.randomize();
      data = f.data;
      $display("[%0t] Sending Data=%0d", $time, f.data);
      #10;
    end
    
    sem.put(1);
    $display("Releases Access!!");
  endtask
  
  task send_second ();
    sem.get(1);
    $display("Access is got to second task..");
    
    for (int i=0;i<5;i++) begin
      s.randomize();
      data = s.data;
      $display("[%0t] Sending data=%0d", $time, s.data);
      #10;
    end
    
    sem.put(1);
    $display("Release Access!!");
  endtask
  
  
  task run();
    sem = new(1);
    f = new();
    s = new();
    
    fork
      send_first ();
      send_second ();
    join
    
  endtask

endclass



module tb();
  
  main m;
  
  initial begin
    m = new();
    m.run();
  end
  
endmodule
