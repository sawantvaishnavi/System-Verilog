// Constraint Operators-  := , :/

class mode;
  rand bit [1:0] a;
  rand bit [1:0] b;
  
  constraint data1 {
    
    a dist { 0 := 10, 1 := 60, 2 := 60, 3 := 60 };
    
  }
  
  constraint data2 {
    
    b dist {0 :/ 10, [1:3] :/ 60};
    
  }
  
endclass

module tb;
  mode m;
  
  initial begin
    m = new();
    
    for (int i=0; i<10; i++) begin
      if(m.randomize()) begin
        $display("Iteration %0d -> a=%0d (dist1), b=%0d (dist2)", i, m.a, m.b);
      end
      else
        $display("Failed!!");
      
    end
  end
endmodule
