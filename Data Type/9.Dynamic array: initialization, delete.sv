/* 1. The default size of a dynamic array is zero until it is set by the new() constructor.
2. The new() function is used to allocate a size for the array and initialize its elements if required.
3. In an empty array you cannot read or write any data to it,
4. because of 3rd point we can say, that why new construct is used. */

module tb();
  int arr [];    //dynamic array is decalred
  
  initial begin
    arr = new [5] ;  //new constructor is used to declare array size
    
    for(int i =0; i<5; i++) begin
      arr [i] = 5*i;
    end
    $display("arr =  %0p", arr);
  
    arr.delete();
    $display("arr =  %0p", arr);  //after deleting empty array you will get --> arr = '{}
    
    for(int i =0; i<5; i++) begin
      arr [i] = 5*i;
    end
    $display("arr =  %0p", arr);  // num bez you are trying to write in empty array.
  end
  
endmodule
