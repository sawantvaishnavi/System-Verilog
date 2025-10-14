//A. Using iteration
module tb;

  function int gcd(input int a, input int b);
    int temp;
    while (b != 0) begin
      temp = a % b; // store remainder
      a = b;        // move b to a
      b = temp;     // move remainder to b
    end
    return a; // when b becomes 0, a is GCD
  endfunction

  initial begin
    int result = gcd(48,18);
    $display("GCD = %0d", result); // should print 6
  end
endmodule


//B.using recursion
module tb ();
  function int gcd (int a, int b);
    if (b == 0)
      return a;
    else 
      return gcd (b, a%b);
  endfunction
  
  initial begin
    int answer = gcd (48,18);
    $display("GCD is: %0d",answer);
  end
endmodule
