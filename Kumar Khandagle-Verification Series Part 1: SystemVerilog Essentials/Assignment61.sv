class generator;
  
  rand bit [7:0] x;
  rand bit [7:0] y;
  rand bit [7:0] z;
  
endclass


module tb;
  
  generator g;
  
  initial begin
    g = new();
    
    for(int i=0; i<20; i++) begin
      g.randomize();
      $display("At time=%0t, x=%0d, y=%0d, z=%0d",$time, g.x, g.y, g.z);
      #20;
    end
  end
endmodule
