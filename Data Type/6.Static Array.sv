/* - Static Array known as fixed size array.
- The size is known before compilation time.
- If you haven't initialized the array, it will take the default value. The default value for the bit type is zero.
- To display all the elements in the array %0p format specifier is used.  /

//Static Array

module tb();
  bit arr1[8];  //arr1 can store 8 elements; arr1[7:0] lith this also we can write 
  bit arr2[] = {1,1,0,1} ; //size is not declared, but initial values of array are defined, which helps to predict size of array.
  
  initial begin
    $display("Size of Arr1 = %0d", $size(arr1));
    $display("Size of Arr2 = %0d", $size(arr2)); 
    
    $display("First element of arr1: %0d", arr1[0]); //trying to access first element of arr1
    
    arr1[1] = 1;   //we initilized 2nd element as 1
    $display("First element of arr1: %0d", arr1[1]);
    
    $display("Value of all elements of array = %0p", arr2); //display all elements of array
    
  end
  
endmodule
