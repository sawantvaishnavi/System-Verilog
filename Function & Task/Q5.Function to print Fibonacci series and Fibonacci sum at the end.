module tb;

  function automatic int fibonacci (input int n);
    if (n <= 0)
      return 0;
    else if (n == 1)
      return 1;
    else
      return fibonacci(n-1) + fibonacci(n-2);
  endfunction

  
  initial begin
  int n = 6; // number of Fibonacci terms to print
  int result;
    int sum = 0;
  
  for (int i = 0; i < n; i++) begin
    result = fibonacci(i);
    $display("f(%0d) = %0d", i, result);
    sum = fibonacci(i) + sum;   //sum += result; u can use this also
    
  end
    $display("Total Sum is: %0d", sum);
    
  $finish;
end
  
endmodule
