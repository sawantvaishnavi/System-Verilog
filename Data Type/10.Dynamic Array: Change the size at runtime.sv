/* - In this code we are doing 2 operation:
  1.Change the size at runtime: Can be increased or decreased.
  2.Copy dynamic array to fixed size array. */

module tb ();
  int arr[];
  int fixed_arr[20]; 
  
  initial begin 
    arr = new [5];
    
    for (int i =0; i<5; i++) begin
      arr [i] = 5*i;
    end
    $display("arr =  %0p", arr);
    
    
    arr = new [20](arr);  // size of array has been changed at runtime and copied existing items.   
    $display("arr =  %0p", arr);
    
    fixed_arr = arr;   //Copy dynamic array to fixed size array.
    $display("Fixed_arr = %0p",fixed_arr);
    
    arr = new [30];  // size of array has been changed at runtime   
    $display("arr =  %0p", arr);
        
    arr = new [2];  // size of array has been  at runtime   
    $display("arr =  %0p", arr);
   
  end
endmodule
