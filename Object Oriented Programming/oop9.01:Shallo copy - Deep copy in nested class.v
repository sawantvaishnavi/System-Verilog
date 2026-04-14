/// 1.Shallow copy
class address_range ;
  bit [31:0] start_address;
  bit [31:0] end_address;
  
  function new();
    start_address = 10;
    end_address   = 50;
  endfunction
  
endclass


class packet;
  bit [31:0] addr;
  bit [31:0] data;
  
  address_range ar;  //class handle
  
  function new();
    addr = 32'h10;
    data = 32'hFF;
    ar   = new(); //creating object
  endfunction
  
  function void display();
    $display("------------------------------------------------");
    $display("\t addr = %0h", addr);
    $display("\t data = %0h", data);
    $display("\t start_address = %0d", ar.start_address);
    $display("\t end_address   = %0d", ar.end_address);
    $display("------------------------------------------------");
   endfunction
endclass 


  module class_assignment;
    packet pkt_1;
    packet pkt_2;
    
    initial begin
      pkt_1 = new(); //creating pkt_1 object
      $display("****Calling pkt_1 display****");
      pkt_1.display();
    
      
      pkt_2 = new pkt_1; //calling copy method
      $display("-----");
      pkt_2.display();   // p1 is copied in p2 but in different location
      
      
      //changing values of pkt_2 handle
      pkt_2.addr = 32'h68;
      pkt_2.ar.start_address = 60;
      pkt_2.ar.end_address   = 80;   
      $display("\t **** calling pkt_1 display after changing pkt_2 properties ****");
      
      
      //changes made in pkt_2.ar properties reflect on pkt_1.ar ,
      //so only handle of the object get copied this is called shallo copy
      pkt_1.display();   
      $display("\t **** calling pkt_2 display after changing pkt_2 properties ****");
      pkt_2.display();
      
    end
  endmodule




///2.Deep copy
class address_range ;
  bit [31:0] start_address;
  bit [31:0] end_address;
  
  function new();
    start_address = 10;
    end_address   = 50;
  endfunction
  
  //copy methos
  function address_range copy;
    copy = new();
    copy.start_address = this.start_address;
    copy.end_address  = this.end_address;
    return copy;
  endfunction
endclass

class packet;
  bit [31:0] addr;
  bit [31:0] data;
  
  address_range ar;  //class handle
  
  function new();
    addr = 32'h10;
    data = 32'hFF;
    ar   = new(); //creating object
  endfunction
  
  function void display();
    $display("------------------------------------------------");
    $display("\t addr = %0h", addr);
    $display("\t data = %0h", data);
    $display("\t start_address = %0d", ar.start_address);
    $display("\t end_address   = %0d", ar.end_address);
    $display("------------------------------------------------");
   endfunction
  
  //copy method
  function packet copy();
    copy = new();
    copy.addr = this.addr;
    copy.data = this.data;
    copy.ar   = ar.copy;  //calling copy function of tr
    return copy;
  endfunction

 endclass 

  module class_assignment;
    packet pkt_1;
    packet pkt_2;
    
    initial begin
      pkt_1 = new(); //creating pkt_1 object
      $display("****Calling pkt_1 display****");
      pkt_1.display();
      
      pkt_2 = new(); //creating pkt_2 object
      $display("****Calling pkt_2 display****");
      pkt_2.display();
      
      pkt_2 = pkt_1.copy(); //calling copy method
      
      //changing values of pkt_2 handle
      pkt_2.addr = 32'h68;
      pkt_2.ar.start_address = 60;
      pkt_2.ar.end_address   = 80;
      
      $display("\t **** calling pkt_1 display after changing pkt_2 properties ****");
      pkt_1.display();
      
      $display("\t **** calling pkt_2 display after changing pkt_2 properties ****");
      pkt_2.display();
      
    end
  endmodule

//more simple to understand deep copy
class first;
  bit [3:0] data;
  bit [3:0] addr;
  
  function first copy();
    copy = new();
    copy.data = this.data;
    copy.addr = this.addr;
    return copy;
  endfunction
  
endclass

class second;
  bit [3:0] new_data;
  bit [3:0] new_addr; 
  
  first f;
  
  function new ();
    f = new();
  endfunction
  
  function second copy();
    copy          = new();
    copy.new_data = this.new_data;
    copy.new_addr = this.new_addr;
    copy.f        = f.copy;
    return copy;
  endfunction
  
endclass

module tb;
  
  second s1, s2;
  
  initial begin
    s1 = new();
    
    s1.f.data = 1;
    s1.f.addr = 2;
    s1.new_data = 3;
    s1.new_addr = 4;
    
    $display("--------------------------------------------------------------");
    $display("data = %0d, addr = %0d, new_data = %0d, new_addr = %0d", s1.f.data, s1.f.addr, s1.new_data, s1.new_addr);
    
    $display("--------------------------------------------------------------");
    $display("               Deep Copy                        ");
    
    s2 = s1.copy();  //deep copy
    $display("data = %0d, addr = %0d, new_data = %0d, new_addr = %0d", s2.f.data, s2.f.addr, s2.new_data, s2.new_addr);
    
    $display("--------------------------------------------------------------");
    $display("               Internal objects changed                        ");
    s2.f.data = 14;
    s2.f.addr = 15;
    $display("S1: data = %0d, S1: addr = %0d, S2: data = %0d, S2: addr = %0d, S1: new_data = %0d, s1: new_addr = %0d, S2: new_data = %0d, S2: new_addr = %0d", s1.f.data, s1.f.addr, s2.f.data, s2.f.addr, s1.new_data, s1.new_addr, s2.new_data, s2.new_addr);
    $display("--------------------------------------------------------------");
  end
endmodule
