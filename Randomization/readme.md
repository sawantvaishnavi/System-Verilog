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
