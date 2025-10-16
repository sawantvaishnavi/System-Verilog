/* 
1.Create a constraint where if enable == 1, then addr must be even.
2.Make a rule that if mode and key are logically equivalent — meaning when one is 1, the other must also be 1.
3.Write a constraint such that when opcode == 0, data must be 8’hFF; otherwise, data should be random between 0–127.
*/

class operator;
  rand bit en;
  rand bit [3:0] addr;
  
  rand bit mode;
  rand bit key;
  
  rand bit opcode;
  rand bit [7:0] data;
  
  
  constraint addr_rule {  
    (en == 1) -> (addr % 2 == 0);
  }
  
  constraint mode_key {
    mode <-> key;
  }
  
  constraint opcode_dist{
    opcode dist {0 := 50, 1 := 50};  //probability of occuring 1 and 0 for opcode is 50%
  }
  
  constraint data_logic {
    if (opcode == 1)
    {
      data == 8'hFF;
    }
      else
      {
        data inside {[0:127]};
      }
  }
  
endclass


module tb ();
  
  operator op;
  
  initial begin 
    op = new();
    repeat (30) begin
      if(op.randomize())
        $display("En=%0b, Addr:%0d   | Mode=%0b, Key=%0b   | opcode=%b, data=%0h",op.en, op.addr,op.mode, op.key, op.opcode, op.data);
      else
        $display("Failed");
    end
  end
  
endmodule

