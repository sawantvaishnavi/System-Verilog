# Question

## Q1: What is the difference between rand and randc?

## Answer:
In SystemVerilog, both `rand` and `randc` are used to declare random variables inside a class.
## 1️⃣ rand
- Generates random values.
- Values may repeat.
- No guarantee that all values will be used.
- Follows given constraints.
## 2️⃣ randc (Random Cyclic)
- Generates random values in a cyclic manner.
- All possible values are generated once before repeating.
- No repetition until full cycle completes.
- Useful when coverage of all values is required.

### Code

```systemverilog
class generator;
  
randc bit [3:0] a, b; // rand or randc 
    
endclass
 
module tb;
  generator g;
  
  initial begin
    g = new();
    
    for(int i = 0; i < 10; i++) begin
      g.randomize();
      $display("Value of a :%0d and b: %0d", g.a, g.b);
      #10;
    end
    
  end
  
endmodule
```
---
## Q2. What does `randomize()` return?

### Answer:
`randomize()` returns:
- `1` → if randomization is successful
- `0` → if randomization fails (due to constraint conflict)

### Code
```systemverilog
class generator;
  randc bit [7:0] a;
  
  constraint condition1 { 
    a>3; 
    a<7;
  } 
endclass

module tb;
  generator g;
  initial begin
    g = new();
    for (int i=0; i<3; i++) begin
      // g = new(); //if new object is created for each iteration then no use of randc, values will repeate

      if(g.randomize())
      $display("At time: %0t, a=%0d", $time, g.a);
      else
        $display("Randomizatoion Failes");
      #10;
    end
  end
endmodule
```
---

## Q3. Write a SystemVerilog program that demonstrates how to apply a range constraint and how to exclude (skip) a specific range during randomization.
### Answer:
### Code1️⃣: Constrain a Variable Within a Range : inside operator
```systemverilog
class generator ;
  
  randc bit [3:0] a;
  randc bit [3:0] b;
  
  constraint data {
    a inside { [0:5], [8:10], 15 }; //a takes values: 0,1,2,3,4,5,8,9,10,15
    b inside { [10:15] }; // b take values: 10,11,12,13,14,15
  }
  
endclass

module tb;
  generator g;
  
  initial begin
    g = new();
    for(int i=0; i<10; i++) begin
      g.randomize();
      $display("At Time=%0t, Value of A=%0d, B=%0d", $time, g.a, g.b);
      #10;
    end
  end
endmodule
```
### Code2️⃣: Skip Specific range : !inside operator
```systemverilog
class generator ;
  
  randc bit [3:0] a;
  randc bit [3:0] b;
  
  constraint data {
    !(a inside { [5:10] }); // a Skips values: 5,6,7,8,9,10
    !(b inside { [0:4] }); // b Skips values: 0,1,2,3,4
  }
  
endclass

module tb;
  generator g;
  
  initial begin
    g = new();
    for(int i=0; i<10; i++) begin
      g.randomize();
      $display("At Time=%0t, Value of A=%0d, B=%0d", $time, g.a, g.b);
      #10;
    end
  end
endmodule
```
---
## Q4. Are constraints in SystemVerilog limited to class scope, or can they be declared outside a class?

### Answer:
Constraint blocks must belong to a class. However, they can be declared inside the class and defined outside using the `extern` keyword and scope resolution operator.

## Coding Question:
Write a SystemVerilog class `transaction` with two random variables `addr` and `data`.

1. Declare a constraint inside the class using `extern`.
2. Define the constraint outside the class using the scope resolution operator.
3. Ensure:
   - addr is between 10 and 20
   - data is an even number
4. Declare a `display()` function using `extern` inside the class and define it outside the class.
5. In the testbench, randomize the object 5 times and display the values using the display function.

### Code:
```systemverilog
class transaction;
 
  randc bit [7:0] addr;
  randc bit [7:0] data;
  
  extern constraint addr_data_valid ;
  
  extern function void display();
    
endclass
   
    constraint transaction::addr_data_valid{
    
      addr inside {[10:20]};
      data % 2 == 0;
      
    };
    
    function void transaction::display ();
      $display("Addr=%0d, Data=%0d", addr, data);
    endfunction
    
module tb();
  transaction t;
  
  initial begin
    t = new();
    
    for(int i=0; i<5; i++) begin
      if(!t.randomize())
        $display("Randomization Failed");
      else
        t.display();
      #10;
    end
  end
endmodule
```
---
## Q4. What is the difference between `pre_randomize()` and `post_randomize()` in SystemVerilog?

### Answer

### 1️⃣ pre_randomize()

`pre_randomize()` is a function that runs automatically **before randomization**.

It is typically used to:

1. Initialize variables  
2. Enable/disable constraints  
3. Set values that affect constraints  
4. Prepare the object before randomization  

---

### 2️⃣ post_randomize()

`post_randomize()` runs automatically **after randomization completes successfully**.

It is used to:

1. Display generated values  
2. Perform calculations
3. Check relationships
4. Update dependent variables

  ## SystemVerilog Randomization Example

### Question

Write a SystemVerilog class `packet` with the following requirements:

1. The class contains two random variables:
rand bit [3:0] addr  
rand bit [3:0] data  
2. Add a constraint such that: addr < data
3. Use `pre_randomize()` to: Print the message **"Randomization Starting"**
4. Use `post_randomize()` to: Display the randomized values of `addr` and `data`
5. In the testbench: Create an object of the class and call `randomize()`.

```systemverilog
class packet;
  
  rand bit [3:0] addr;
  rand bit [3:0] data;
  
  constraint addr_data {
    addr < data;
  }

  function void pre_randomize();
    $display("Randomization Starting");
  endfunction
  
  function void post_randomize();
    $display("Values of ADDR=%0d DATA=%0d", addr, data);
  endfunction
  
endclass


module tb;
  
  packet p;

  initial begin
    p = new();
    p.randomize(); 
  end

endmodule
```
--- 
