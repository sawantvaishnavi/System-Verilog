class packet;
  rand bit [7:0] a , b;
  
  constraint c_small { a inside {[0:50]}; b inside {[0:50]}; }
  constraint c_large { a inside {[100:200]}; b inside {[100:200]}; }
  
  function void display ();
    $display("a=%0d, b=%0d", a, b);
  endfunction
endclass

module tb;
  packet pkt;
  
  initial begin
    pkt = new();
    
    //Case1: Small constraints enable only
    pkt.c_small.constraint_mode(1);
    pkt.c_large.constraint_mode(0);
    pkt.randomize();
    $display("Small Range: ");
    pkt.display();
    
    
    //Case2: large constraint enable only
    pkt.c_small.constraint_mode(0);
    pkt.c_large.constraint_mode(1);
    pkt.randomize();
    $display("Large Range: ");
    pkt.display();
    
    //Case3:Disable randomization for a
    pkt.a.rand_mode(0);
    pkt.randomize();
    $display("Disabled Randomization for a");   //When randomization disabled for a → a stays same, only b changes
    pkt.display();
    
  end
  
endmodule
