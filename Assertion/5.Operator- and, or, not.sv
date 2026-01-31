//////////////// and example ////////////////
Q1. If start rises, then in the next clock cycle: a must be HIGH for 2 consecutive cycles, b must be HIGH for 2 consecutive cycles, both must happen together
Ans.
 sequence sa;
 a[*2];
endsequence 
sequence sb;
 ##1 b[*2];
endsequence 
assert property (@(posedge clk) $rose(start) |=> sa and sb)$info("Suc at %0t",$time);

 Q2.What does this mean in plain English?
   assert property (@(posedge clk)(a and b) |-> c); 
 Ans. 
Only when BOTH a and b are high in the SAME cycle, the implication triggers
Then c must be high in that SAME cycle (because |-> is overlapping)
So yes: a, b, c must all be high in the same clock
     

Q3. Explain the difference (conceptually, no waveform):
      (a and b)[*2]
      vs
      a[*2] and b[*2]
Are they equivalent? Why / why not?
Ans.
Case 1:
(a and b)[*2]
Meaning:
For 2 consecutive cycles:
a and b must be high together

Case 2:
a[*2] and b[*2]
Meaning:
a is high for 2 cycles (starting at RHS start)
b is high for 2 cycles (starting at SAME RHS start)
They may or may not be high in the same cycle
These are NOT equivalent

//////////////// or & not ////////////////
Q4. If req is asserted, then either gnt or wait must be high, and err must NOT be high in the same clock cycle.
 Ans.
 assert property (@(posedge clk) req |-> ((gnt or wait) and not err));

     
