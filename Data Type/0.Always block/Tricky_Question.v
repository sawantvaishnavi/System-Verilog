Q1. If I write:

always_comb
  if (en)
    dout = din;

(no else)
What happens?
  a.Latch inferred
  b.Compilation error
  c.Pure combinational

Ans. 
In SystemVerilog with always_comb:   It will NOT silently infer a latch.   The compiler will give an error or warning.
  
always_comb has a strict rule:
Every variable assigned inside must be assigned in all possible paths.
In your code:
When en = 1 → dout assigned
When en = 0 → dout NOT assigned
That means incomplete assignment → implies storage.
But always_comb does NOT allow unintended storage.

So tools typically report:
Error: variable not assigned in all paths
