// Check the design intent for 4-bit AND gate 

module and2
 
(
 
input [3:0] a,b,
 
output [3:0] y
 
);
 
assign y = a & b;
 
 
 
///////////Add your code here
 
 
  always@(*) begin
    assert (y == (a&b)) $info("Pass"); else $error("Fail");
  end
 
 
 
 
/////////End your code here
 
 
 
endmodule
