class practice;
  bit [3:0] a;
  bit [3:0] b;
  bit [3:0] c;
  
  task assignment (input bit [3:0] a = 0, input bit [3:0] b = 0, input bit [3:0] c = 0, output bit [3:0] results);
    this.a = a;
    this.b = b;
    this.c = c;
    results = a + b + c;
  endtask
endclass


module tb;
  practice f1;
  bit [3:0] sum;
  initial begin
    f1 = new();
    f1.assignment(1, 2, 4, sum);       
    $display("Value of a=%0d, b=%0d, c=%0d and sum=%0d", f1.a, f1.b, f1.c, sum);
  end
endmodule
