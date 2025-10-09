module tb ();
  int expected_val = 'd12;
  function int multiplication(input int unsigned a, int unsigned b);
    int ans;
    ans = a*b;
    return ans;
  endfunction

 
  function void comp (input int ans);
    if (ans == expected_val)
      $display("Test Passed");
    else
      $display("Test Failed");
  endfunction

 
  int ans = 0;
  initial begin
    ans = multiplication (4'b0010, 4'b0110);
    $display("Answer is = %0d",ans);
    comp(ans);
  end
endmodule
