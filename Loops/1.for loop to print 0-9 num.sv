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
