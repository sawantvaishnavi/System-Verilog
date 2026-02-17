//Design a transparent latch

module transperent_dlatch (
	input logic en,
	input logic din,
	output logic dout);
  
  always_latch
    begin
      if(en)
        dout = din;  //Latches are level-sensitive, not edge-triggered.always_latch is meant to behave like combinational-style code with  storage.
    end
  
endmodule
