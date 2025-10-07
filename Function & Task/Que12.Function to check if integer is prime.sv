module tb;
  
  function bit prime (input int num);
    if (num <= 1)
      return 0;
    else if (num == 2 || num == 3)
      return 1;
    else if (num % 2 == 0 || num % 3 == 0)
      return 0;
    else begin
      // check only numbers of the form 6k ± 1
      for (int i = 5; i * i <= num; i += 6) begin
        if (num % i == 0 || num % (i + 2) == 0)
          return 0;
      end
    end
    return 1;
  endfunction
        
  initial begin
    bit result = prime(7); // function returns bit, so store in bit
    $display("Ans: %0b", result);
    if (result)
      $display("Prime number");
    else 
      $display(" Not a Prime number");
  end

endmodule
