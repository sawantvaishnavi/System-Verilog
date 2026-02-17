//Que. Write a SystemVerilog module for a 4-bit ALU.

module alu (
  input [3:0] a, b,
  input [1:0]sel,
  output reg [4:0] out);
  
  always_comb 
    begin
      
      case (sel)
        2'b00: out = a + b;
        2'b01: out = a - b;
        2'b10: out = a & b;
        2'b11: out = a | b;
        default: out = 0;
        
      endcase
    end
  
endmodule
