class transaction;
 
bit [7:0] addr = 7'h12;
bit [3:0] data = 4'h4;
bit we = 1'b1;
bit rst = 1'b0;
 
endclass


class generator;
  
  transaction t;
  mailbox #(transaction) mbx;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  
  task run();
    t = new();
    $display("[Gen] sending addr:%0h, data=%0h, we=%0b, rst=%0b", t.addr, t.data, t.we, t.rst);
    mbx.put(t);
  endtask
endclass


class driver;
  
  transaction dc;
  mailbox #(transaction) mbx;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    mbx.get(dc);
     $display("[DRV] sending addr:%0h, data=%0h, we=%0b, rst=%0b", dc.addr, dc.data, dc.we, dc.rst);
  endtask
endclass

module tb ();
  
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  
  initial begin
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
    
    fork
    gen.run();
    drv.run();
    join
  end
endmodule
