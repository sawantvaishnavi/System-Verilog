//D ff behaviour
module dff
(
input din, clk, rst,
output reg dout  
);
  
  always@(posedge clk)
    begin
      if(rst)
        dout <= 1'b0;
      else
        dout <= din;
    end
  
  always@(posedge clk)
    begin
      assert (dout == (rst ? 1'b0 : din)) $info("Pass"); else $error("Fail");
    end
endmodule
