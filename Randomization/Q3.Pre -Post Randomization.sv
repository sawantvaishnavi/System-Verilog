/* model a temperature sensor class where the sensor generates random temperature readings between -20°C and 120°C.

1. Use pre_randomize() to reset or modify any variable or flag before each randomization.
2. Use post_randomize() to categorize the temperature reading as:

		- "Cold" if below 10°C
		- "Normal" if between 10°C and 40°C
		- "Hot" if above 40°C
*/


class temp;
  
  rand int t;
  string msg;
  
  constraint gen_temp {
  
    t inside {[0:120]};
  }
 
  //You don’t need to call pre_randomize() or post_randomize() manually.Both are automatically executed whenever you call the built-in randomize() function.
  /* Before Randomization  -- pre_randomize()
     During Randomization  -- randomize()
     After Randomization   -- post_randomize()
     */
  
  
  function void pre_randomize();
    msg = "Getting new temp reading...";
    $display("%s",msg);
  endfunction
  
  function void post_randomize();
    if(t<10)
      $display("cold temp=%0d",t);
    else if (t>10 && t<40)
      $display("Normal temp=%0d",t);
    else
      $display("Hot temp=%0d",t);
    
  endfunction
endclass
      
module tb;
  
  temp t1;
  
  initial begin
    t1 =new();
    repeat(5)  begin
      if(!t1.randomize())
        $display("Randomization Failed!");
    #20;
    end
  end
  
endmodule        
