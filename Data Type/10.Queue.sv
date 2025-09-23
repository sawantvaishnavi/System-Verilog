//- A SystemVerilog queue is a First In First Out scheme which can have a variable size to store elements of the same data type.

module tb ();
  
  int arr [$];   //this doller sign maked diff between dynamic array and queue
  
  initial begin
    arr = {1,2,3};  // initilization of queue, no apostrophe sign is needed
    $display("arr= %0p",arr);
    
    arr.push_front(7);
    $display("arr= %0p",arr);
    
    arr.push_back(9);
    $display("arr= %0p",arr);
    
    arr.insert(2,6); //at 2nd position add 6
    $display("arr= %0p",arr);
    
    arr.pop_front();
    $display("arr= %0p",arr);
    
    arr.pop_back();
    $display("arr= %0p",arr);
    
    arr.delete(1);  // delete element at index of 1
    $display("arr= %0p",arr);
  end
endmodule
