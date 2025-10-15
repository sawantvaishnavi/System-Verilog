//Write a function is_prime() and use it in a constraint so that only prime numbers between 1 and 50 are generated

class generator;
  
  rand int n;   // the random variable

  extern function bit is_prime(int num);
  extern constraint data;
  extern function void post_randomize();  
    
endclass


// Constraint definition
constraint generator::data {
  n inside {[1:50]};   //  correct variable name
 
};
      
      
// Function definition
function bit generator::is_prime(int num);
  if (num < 2)
    return 0;
  else if (num == 2 || num == 3)
    return 1;
  else if (num % 2 == 0 || num % 3 == 0)
    return 0;
  else begin
    for (int i = 5; i * i <= num; i = i + 6) begin
      if (num % i == 0 || num % (i + 2) == 0)
        return 0;
    end
  end
  return 1;   //  final return statement
endfunction

//you cannot use loops or complex if logic inside a constraint block, but you can do anything inside post_randomize().
function void generator::post_randomize();
  if(is_prime(n))
     $display("Prime number: %0d", n);
  else
    $display("Not a Prime number: %0d", n);   //g.n is not using because g is handler defined inside tb top. 
endfunction


module tb;
  generator g;
  
  initial begin
    g = new();
    
    for (int i = 0; i < 20; i++) begin
      if (!g.randomize())
        $display("Randomization failed!");
      #20;
    end
   
  end
endmodule
