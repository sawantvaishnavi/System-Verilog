//a
module tb();
  
  task add (input bit [3:0] a, input bit [3:0] b, output bit [4:0] sum, output bit [3:0] diff);
    begin
      sum = a + b;
      diff = a - b;
    end
  endtask
  
  initial begin
    bit [4:0] results_sum = 0;
    bit [3:0] results_diff = 0;
    add(4'b1001, 4'b0001, results_sum, results_diff);
    $display("sum is: %0b and diff is: %0b", results_sum, results_diff);
      
  end
  
endmodule



//b Add and sub at posedge clk with random numbers and display that random numbers also
module tb();
  bit clk;
  
  initial clk =0;
  always #10 clk = ~clk;
  
  task add (input bit [3:0] a, input bit [3:0] b, output bit [4:0] sum, output bit [3:0] diff);
    begin
      sum = a + b;
      diff = a - b;
    end
  endtask
  
  initial begin
    bit [3:0] a_in, b_in;
    bit [4:0] results_sum = 0;
    bit [3:0] results_diff = 0;
    repeat (10) begin
    @(posedge clk)
      a_in = $urandom;
      b_in = $urandom;
      add(a_in, b_in, results_sum, results_diff);
      $display("a=%0d(%0b), b=%0d(%0b), sum is:%0d(%0b), and diff is:%0d(%0b)", a_in,a_in,b_in, b_in, results_sum,results_sum, results_diff,results_diff);
    end
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars ();
    #200; $finish;
  end
  
endmodule
