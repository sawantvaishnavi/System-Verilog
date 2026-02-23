//Try this code with and without virtual keyword and see results

class character;
  string name;
  int health;
  
  function new(string name, int health);
    this.name = name;
    this.health = health;
  endfunction
  
  virtual function void attack ();
    $display("Character attacks");
  endfunction
  
  function void display();
    $display("Name=%0s, Health=%0d", this.name, this.health);
  endfunction
endclass

class warrier extends character;
  int strength;
  
  function new (string name, int health, int strength);
    super.new (name, health);
    this.strength  = strength;
  endfunction
  
  function void attack();
    $display("Warrior attacks with sword");
  endfunction
  
  function void display();
    super.display();
    $display("Strength=%0d", strength);
  endfunction
endclass

class mage extends character ;
  int mana;
  
  function new (string name, int health , int mana);
    super.new(name, health);
    this.mana = mana;
  endfunction
  
   function void attack();
    $display("Mage casts spell");
  endfunction
  
  function void display();
    super.display();
    $display("Mana=%0d", this.mana);
  endfunction
endclass

// module tb;
//   initial begin
//     warrier wr;
//     wr= new("Thor", 100, 50);
//     wr.display();
//     wr.attack();
//   end
// endmodule

module tb;
  initial begin
    character c;
    warrier wr;
    mage mg;
    
    wr= new("Thor", 100, 50);
    mg = new("Loki", 80, 200);
    
    c=wr;
    c.attack();
    
    c = mg;
    c.attack();
  end
endmodule
