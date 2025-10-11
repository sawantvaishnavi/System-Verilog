//1.Public - Means Any code outside the class (like your testbench) can directly access it.

class bank;
  
  real balance;
  
  //This constructor ensures that whenever you create a bank_account object —you start with a valid balance (never negative).
  //It’s not syntactically required, but it’s logically important for reliability and good design.
  
  function new (real initial_balance);
    if (initial_balance >= 0)
      balance = initial_balance;
    else
      balance = 0;
      $display("Invalid initial balance. Set to 0.");
  endfunction
 
  
  //Setter (to modify balance safely)
  function void deposite (real amount);
    if (amount > 0) begin
      balance = balance + amount;
      $display("After deposite Balance is: %0f",balance);
    end
    else
      $display("Invalid deposit amount!");
  endfunction
  
  
  //Setter (to withdraw money safely)
  function void withdraw (real amount);
    if (amount > 0 && amount <= balance) begin
      balance -= amount;
      $display("After withdraw Balance is: %0f",balance);
    end
    else
      $display("Invalid or insufficient balance!");
  endfunction
  
  
  //Getter (to read the balance)
  function real get_balance();
    $display("Your Balance is: %0f",balance);
    return balance;
  endfunction
  
endclass


module tb();
  initial begin
   bank acc1;
     // Object creation with initial balance
    acc1 = new (10);
    
    // Public variable can be accessed directly (allowed)
    acc1.balance = 100;   //  Direct access (public)
    $display("Directly modified balance: %0f", acc1.balance);
    
    acc1.deposite (500);
    acc1.withdraw (34);
    acc1.get_balance();
    
    // Again, direct read of public data member (allowed)
    $display("Direct access again: Balance = %0f", acc1.balance);
  end
endmodule




//2.Local - Access

class bank;
  
 local real balance;
  
  function new (real initial_balance);
    if (initial_balance >= 0)
      balance = initial_balance;
    else
      balance = 0;
      $display("Invalid initial balance. Set to 0.");
  endfunction
 
  
  //Setter (to modify balance safely)
  function void deposite (real amount);
    if (amount > 0) begin
      balance = balance + amount;
      $display("After deposite Balance is: %0f",balance);
    end
    else
      $display("Invalid deposit amount!");
  endfunction
  
  
  //Setter (to withdraw money safely)
  function void withdraw (real amount);
    if (amount > 0 && amount <= balance) begin
      balance -= amount;
      $display("After withdraw Balance is: %0f",balance);
    end
    else
      $display("Invalid or insufficient balance!");
  endfunction
  
  
  //Getter (to read the balance)
  function real get_balance();
    $display("Your Balance is: %0f",balance);
    return balance;
  endfunction
  
endclass


module tb();
  initial begin
    bank acc1;
    acc1 = new(10);
    
    acc1.deposite(500);
    acc1.withdraw(34);
    acc1.get_balance();

    //No code outside the class can see or access balance directly — not even for $display, read, or write. so get_balance function is used.
    // This will cause a compilation error because balance is local
    // acc1.balance = 1000;  // Illegal access
  end
endmodule
