//A. number of 1 in 4 bit number
module tb;
  
  function int count (input [3:0] num);
    int cnt = 0;
    for(int i=0; i<4; i++) begin
     if (num[i])
       cnt = cnt +1;
      else
        cnt = cnt;
    end  
    return cnt; 
  endfunction
 
  
  initial begin 
    int total_count;
    total_count = count(4'b1011);
    $display("Total count of 1 is: %0d",total_count);
  end
  
endmodule


//b. find num of 1 in given number width is variable
//$size() only works on arrays, not on scalar variables like int.
// use $bits(num) to get bit width.

module tb;
  
  function int count(int num);
   int cnt = 0;
    for(int i =0; i<$bits(num); i++) begin
      if(num[i])
        cnt = cnt + 1 ;
    end
    return cnt;     
  
    
  endfunction
 
  initial begin
    int total_count_binary;
//     int total_count_decimal;
//     int total_count_hexadecimal;
//     int total_count_octal;
   
    
    total_count_binary = count('b1101100111);
    $display("Total Count of 1's is: %0d", total_count_binary);
    
//     total_count_decimal = count('d15);
//     $display("Total Count of 1's is: %0d", total_count_decimal);
        
//     total_count_hexadecimal = count('hAAF);
//     $display("Total Count of 1's is: %0d", total_count_hexadecimal);
    
    
//     total_count_octal = count('o712);
//     $display("Total Count of 1's is: %0d", total_count_octal);
  end
  
endmodule




//C. Counting number of 1 using recursion

module tb();
  
  function int count(input int num);
    if (num == 0)
      return 0;
    else
      return (num & 1) + count(num >> 1);
  endfunction
  
  initial begin
    int answer;
    answer = count('b011001100111);         ///always when u r assigning binary value give 'b or else it will consider as decimal value by default
    $display("Total Count of 1's is: %0d", answer);
    
  end
endmodule
