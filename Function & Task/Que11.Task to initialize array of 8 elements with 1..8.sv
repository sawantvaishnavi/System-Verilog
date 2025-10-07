//A.
// Note: Why ref is important?
// In this code, inside the same module, any task or function can already access global variables directly.
// If you declare another: int array2[8]  -- you can’t reuse the same task to fill it — you’d have to duplicate the code.


module tb();
  
  int array [8];  // array starts with positions 0 to 7, thats why if you change for (int i=1; i<=8; i++) begin array[i] = i;   array[0]=0 coming. so always take care of array position with loop value.
  
  task assign_elements();   
    for (int i=0; i<8; i++) begin
      array[i] = i+1;
    end
  endtask
  
  initial begin
    assign_elements();
    $display("Array Elemnts are: %0p",array);
  end
endmodule


  

//B. using ref 
module tb();
  
  int array [8];  //// declared at module level = static
//When you pass a variable by ref, SystemVerilog connects directly to the variable’s memory — it doesn’t make a copy.
//That means: The variable must exist in a stable scope (not temporary or automatic).
  
  task assign_elements(ref int arr[8]);
    for(int i=0; i<8; i++) begin
      arr[i] = i+1;
    end
  endtask
  
  initial begin
    assign_elements(array);
    $display("Array elements are:%0p",array);
  end
endmodule



//c. Generic way 
module tb();
  
  int array [];  // dynamic array
  
  task assign_elements(ref int arr[]);
    for(int i=0; i<$size(arr); i++) begin
      arr[i] = i+1;
    end
  endtask
  
  initial begin
    
    array = new[8];  //In dynamic array new keyword is used to declare array size  (new[] --> allocates memory)
    
    assign_elements(array);
    $display("Array elements are:%0p",array);
    
  end
endmodule
