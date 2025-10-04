module tb;
  
  function int factorial(input int num);
    if (num <=1)
      factorial = 1;
    else 
      factorial = num * factorial(num - 1);
  endfunction
      
    
    
   initial begin   
     int answer;
     answer = factorial(5);
     $display("Answer is : %0d",answer);
   end
      
  
  
  
endmodule
