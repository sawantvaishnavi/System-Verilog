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
