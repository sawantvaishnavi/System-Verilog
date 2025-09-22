/* 1.Unique Values
2.repetition operator
3.default values

- bit operator has default value 0
- logic operator has default value x */

//Array Initilization

module tb();

  //1.Uninitilized Array
  bit arr1 [5];   //default value is 0
  logic arr2;    //default value is x 
  
  //2.Unique value initilization 
  bit arr3 [ ] = '{1,2,3,4,5};
  logic arr4[ ] = '{1,0,'x,'z};
  
  //3.Repetation operator in array initilization
  bit arr5 [7] = '{7{1}};
  
  //4.Default value
  int arr6 [4] = '{default : 0};
  
  initial begin
    $display("Value of arr1 = %0p",arr1); 
    $display("Value of arr2 = %0p",arr2);
    $display("Value of arr3 = %0p",arr3);
    $display("Value of arr4 = %0p",arr4);
    $display("Value of arr5 = %0p",arr5);
    $display("Value of arr6 = %0p",arr6);
  end
endmodule
