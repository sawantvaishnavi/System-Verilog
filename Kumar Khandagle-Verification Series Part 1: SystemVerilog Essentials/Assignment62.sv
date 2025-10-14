class generator;
  
  rand bit [7:0] x;
  rand bit [7:0] y;
  rand bit [7:0] z;
  
//   constraint data { 0 < x; x < 50;
//                   0 < y; y < 50;
//                   0 < z; z < 50; 
//                   } 
  
  //or 
  
  constraint data { 
    x inside {[0:50]};
    y inside {[0:50]};
    z inside {[0:50]};
  }
  
endclass


module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i=0; i<20; i++) begin
      g.randomize();     //generates new random values for all rand variables.
      $display("At time=%0t, x=%0d, y=%0d, z=%0d",$time, g.x, g.y, g.z);
      #20;
    end
  end
endmodule
