//$urandom and $urandom_range is a system function that runs during simulation time.
//inside task and function we can not write initial begin block.

module tb;
  
  bit [7:0] addr = 0;
  bit wr;
  bit en;
  bit clk;
  
  initial clk = 0;
  always #10 clk = ~clk;
  
 task generate_random();
   
    @(posedge clk) 
    addr = $urandom;
    wr = $urandom;
    en = $urandom;
    $display("addr = %0d, wr = %0d, en = %0d",addr,wr,en);
 
 endtask
  
  initial begin
    repeat (10) begin
      generate_random();
      end
  end
     
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #200 $finish;
  end
  
endmodule
