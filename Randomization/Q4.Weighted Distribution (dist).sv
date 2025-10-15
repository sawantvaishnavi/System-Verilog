/*  Randomize an opcode variable such that:
opcode 0 → 50%
opcode 1 → 30%
opcode 2 → 20% */

class opcode_weight ;
  rand bit [1:0] opcode;
  string msg;
  
  constraint data {
    opcode dist { 0 := 50, 1 := 30, 2 := 20};
  }
  
  function void pre_randomize();
    msg = "The weight of opcode is generating....";
    $display("%s",msg);
  endfunction
  
endclass

module tb;
  opcode_weight w;
  
  initial begin
    w = new();
    
    repeat(10) begin
      if (w.randomize())
        $display("opcode:%0d",w.opcode);
      else
        $display("Randomization Failed");
      #5;
    end
    
  end
endmodule
