/////////////Design////////////
module sync_mult (
  input bit [3:0] a,
  input [3:0] b,
  input clk,
  output reg [7:0] y );
  
  always@(posedge clk) begin
    y <= a * b ; 
  end 
endmodule


////////////Testbench/////////////
class transaction;
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit clk;
  bit [7:0] y;
  
  //deep copy for randc behaviour work perfectly
  function transaction copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.y = this.y;
  endfunction
  
  function void display();
    $display("a : %0d \t b: %0d \t y : %0d", a, b, y);
  endfunction
  
endclass

//interface is collection of all the ports present in module.
//declare same names helpful in long codes - use logic: supports both contineous and procedural assignment
interface sync_mult_if;
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] y;
  logic clk;
endinterface



class generator;
  transaction t;
  mailbox #(transaction) mbx;
  event done;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    t = new();// deep copy - creating single object to remeber history, so randc works prefectly fine.
  endfunction
  
  task main();
    for(int i=0; i<10; i++) begin
      assert(t.randomize()) else $display("Randomization Failed");
      mbx.put(t.copy);  //instaed of sending original object we are sending copy -- it will allows us to have independent object for each transaction.
      $display("[GEN] : DATA SENT TO DRIVER");
      t.display();
      #20;
    end
    -> done;
  endtask
  
endclass


class driver;
  
  virtual sync_mult_if mulif;
  transaction dc;
  mailbox #(transaction) mbx;
   
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task main();
    forever begin
      mbx.get(dc);
      repeat (2) @(posedge mulif.clk);
      mulif.a <= dc.a;
      mulif.b <= dc.b;
      $display("[DRV] : Interface Trigger");
      dc.display();
    end
  endtask
    
endclass


class monitor;
  mailbox #(transaction) mbx;
  transaction trans; //also require a transaction object because there we’ll be updating the value that we receive from a DUT
  
  virtual sync_mult_if aif;

  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    forever begin
      repeat (2) @(posedge aif.clk);
      trans.a = aif.a;
      trans.b = aif.b;
      trans.y = aif.y;
      $display("[MON] : DATA SEND TO SCOREBOARD");
      trans.display();
      mbx.put(trans);
    end
  endtask
  
endclass


class scoreboard;
  mailbox #(transaction) mbx;
  transaction trans_dc;
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    forever begin
      mbx.get(trans_dc);
      $display("[SCO] : DATA RCVD FROM MON");
      trans_dc.display();
      #40;
    end
  endtask
  
endclass


module tb();
  
  monitor mon;
  scoreboard sco;
  sync_mult_if m_if ();
  generator gen;
  driver drv;
  mailbox #(transaction) mbx;
  event done;
  
  sync_mult dut (.a (m_if.a), .b(m_if.b), .clk(m_if.clk), .y(m_if.y));
  
  initial begin
    m_if.clk <= 0;
  end
  
  always #10 m_if.clk = ~m_if.clk;
  
  initial begin
    mbx = new;
    gen = new (mbx);
    drv = new (mbx);
    drv.mulif = m_if;  //connecting interface
    done = gen.done;  //connecting tb done to generator done
  end
  
  initial begin
    mbx = new();
    mon = new(mbx);
    sco = new(mbx);
    mon.aif = m_if;
  end
  
  initial begin
    mon.run();
    sco.run();
  end
  
  initial begin
    fork
      gen.main();
      drv.main();
    join_none
    wait(done.triggered);
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
endmodule
