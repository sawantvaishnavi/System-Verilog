//	4. Build a class box with length, breadth, height. Constructor sets them; function computes volume.
	
class calculate_vol;
  
  local real volume;
  local real length, breadth, height;
  
  function new (real l, real b, real h );
    length = l;
    breadth = b;
    height = h;
    volume = l*b*h;
  endfunction
  
  function get_display();
    $display("Volume is: %0f", volume);
  endfunction
  
endclass


module tb ;
  
  initial begin
    calculate_vol box;
    box = new (10,5,7);
    box.get_display();
  end
  
endmodule
