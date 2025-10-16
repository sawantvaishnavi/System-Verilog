/* Array Randomization:
1.Static Array - Print random array elements.
2.Dynamic Array - print arr[i] = i
3.Queue - Print random elements.
*/

//1.Static Array
class static_array;
  
  rand bit [7:0] arr [8];  // Declare a static array with "rand"
  
endclass


module tb ();
  static_array  s;
  
  initial begin
    s = new();
    s.randomize();
    $display("Static Array = %0p",s.arr);
  end
endmodule



//2.Dynamic Array
class dynamic_array ;
  rand bit [7:0] d_arr[];  //dynamic array
  
  constraint size_darr { d_arr.size() > 8; d_arr.size() <10;}
  
  constraint value_darr { 
    foreach (d_arr[i])
      d_arr[i] == i;
  }
  
  function void post_randomize();
    foreach (d_arr[i])
      $display("d_arr[%0d] = %0h", i, d_arr[i]);
  endfunction
endclass

module tb;
  dynamic_array d1;
  
  initial begin
    d1 = new();
    if (!d1.randomize())
      $display("Randomization failed!");
  end
endmodule



//3.queue
class queue_arr ;
  rand bit [3:0] queue[$];
  
  constraint size_arr { queue.size() == 4 ;}   //declaring size of queue as 4
  
endclass

module tb;
  queue_arr q;
  
  initial begin
    q =  new();
    q.randomize();
    
    if(q.randomize())
      $display("Queue is: %0p",q.queue);
    else
      $display("Failed");
        
  end  
endmodule

