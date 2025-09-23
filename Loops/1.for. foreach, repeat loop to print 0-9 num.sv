// everyloop should be written in the procedural blocks (always/initial).

module tb ();
  
  int arr [10];
  int i =0;
  
  initial begin
    for (i=0; i<10; i=i+1) begin
      arr[i] = i;     //initilize the array
    end
    $display("elements of array: %0p", arr);
  end
endmodule



/*- Here array initilization is important as variable j is taking value from there.
- j is initilizaed as 10 but he takes value from 0 to 0.*/
module tb ();
 
  int arr [10];
 
  
  initial begin
    foreach(arr[j]) begin
      arr[j] = j;
      $display("%0d", arr[j]);
    end
    $display("elements of array: %0p", arr);
  end
endmodule


/*- Array initilization is important.
- if array size is less than- till that value loop is repetating
- if array size greater than initial size value then zero padding is done.
- change the value of arr[10] and see results.*/
module tb ();
  
  int arr [10];
  int j =0;
  
  initial begin
    repeat (10) begin
      arr[j] = j;
      j++;
    end
    $display("arr: %0p", arr);
  end
endmodule
