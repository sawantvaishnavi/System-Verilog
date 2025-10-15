//Constrain three variables a, b, c such that their sum equals 100.

class generator;
  rand bit [7:0] a;
  rand bit [7:0] b;
  rand bit [7:0] c;
 
  
  constraint conditions1 {
    
    a+b+c ==100;
    a inside {[0:100]};
    b inside {[0:100]};
    c inside {[0:100]};
}
  

  
endclass

module tb;
  
  generator g;
  initial begin
    g = new();
    for (int i=0; i<20; i++) begin
      g.randomize();
      $display("At time: %0t, a=%0d, b=%0d, c=%0d, sum:%0d", $time, g.a, g.b, g.c, g.a+g.b+g.c);
      
      #10;
    end
  end
endmodule



