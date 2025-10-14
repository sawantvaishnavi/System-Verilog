class generator;
  
  rand bit rst;
  rand bit wr;
  
  /////////////////add constraint 
  
  constraint data {
  
    rst dist {0 := 30, 1 := 70};
    wr dist {0 := 50, 1:= 50};
  }
    
endclass
 
/////////////////Add testbench top code

module tb ;
  generator g;
  
  initial begin
    g =  new();
    
    for (int i=0; i<20; i++) begin
      g.randomize();
      $display("rst=%0b, wr=%0b", g.rst, g.wr);
    end
  end
endmodule
