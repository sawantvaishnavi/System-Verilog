class transaction;
 
rand bit [7:0] a;
rand bit [7:0] b;
rand bit wr;
 
endclass

class generator;
  
  transaction t;
  mailbox #(transaction) mbx;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    for(int i=0;i<10;i++) begin
      t = new();
      assert(t.randomize()) else $display("Randomization Failed");
      $display("[GEN]: Data Sent: a=%d | b=%d | wr=%b", t.a, t.b, t.wr);
      mbx.put(t);
      #10;
    end    
  endtask
endclass


class driver ;
  
  transaction dc;
  mailbox #(transaction) mbx;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    forever begin
      mbx.get(dc);
      $display("[DRV]: Data RCVD: a=%d | b=%d | wr=%b", dc.a, dc.b, dc.wr);
      #10;
    end
  endtask
  
endclass

module tb;
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  
  initial begin 
    mbx = new();
    gen = new(mbx);
    drv = new(mbx);
 
  
  fork
    gen.main();
    drv.main();
  join
    
  end
endmodule

