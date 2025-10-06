//a. using int
module tb();
  
  function automatic bit palindrome(input int num, output int rev_out);
    int orig = num;  // creating local copy which will use in comparision
    int last_digit;
    int rev = 0;
    
    
    while (num > 0)begin
      
      last_digit = num % 10;   //finding last digit in given num
      rev = rev*10 + last_digit; //making reverse number
      num = num / 10; 
      //deleting last digit  
    end
    
    rev_out = rev;
    return (orig == rev);   // if orig == rev then it will return 1 or else 0
    
  endfunction
  
  
  initial begin
    int n  = 167321;
    int reversed;
    if (palindrome (n,reversed)) begin
      $display("Original Num- %0d  and Reversed num- %0d", n, reversed);
      $display("%0d - This number is palindrome number", n);
    end
    else begin
      $display("Original Num- %0d  and Reversed num- %0d", n, reversed);
      $display("%0d - This number is not palindrome number", n);
    end
  end
endmodule


//b.using string
module tb;

  // Function to check if a string is palindrome
  function automatic bit is_palindrome_string(input string s);
    int len = s.len();
    
    for (int i = 0; i < len/2; i++) begin
      if (s[i] != s[len-1-i]) begin
        return 0; // Not a palindrome
      end
    end
    
    return 1; // Palindrome
  endfunction

  initial begin
    string word;

    // Test 1
    word = "madam";
    if (is_palindrome_string(word))
      $display("%s is a palindrome", word);
    else
      $display("%s is NOT a palindrome", word);

    // Test 2
    word = "hello";
    if (is_palindrome_string(word))
      $display("%s is a palindrome", word);
    else
      $display("%s is NOT a palindrome", word);

    // Test 3
    word = "racecar";
    if (is_palindrome_string(word))
      $display("%s is a palindrome", word);
    else
      $display("%s is NOT a palindrome", word);

    $finish;
  end
endmodule
