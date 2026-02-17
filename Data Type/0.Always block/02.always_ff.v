//D Flip-Flop with Enable and Async Reset (always_ff)

module dff (
	input logic din, 
	input logic clk,
	input logic en,
  	input logic rst,
	output logic dout);
  
  always_ff@(posedge clk or negedge rst)
    begin
      if(!rst)
        dout <= 0;
      else if(en)
        dout <= din;
    end
  
endmodule
