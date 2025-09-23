/*- In copy operation make size of each array same or else it will through error.
- Arrray operations should be done in procedural block*/

module tb ();
  
  int arr1 [5] = '{1,2,3,4,5};
  int arr2 [5];
  int arr3 [5] = '{1,2,5,4,5};
 
  int status;
  
  
  initial begin 
    arr2 = arr1;  //copying array
    $display("arr2 = %p", arr2);
    #10;
    status = (arr1 == arr3); // compairinig array using == operator
    $display("status: %0d",status);
    
    #10;
    status = (arr1 != arr3); // compairinig array using != operator
    $display("status: %0d",status);
  end
  
endmodule
