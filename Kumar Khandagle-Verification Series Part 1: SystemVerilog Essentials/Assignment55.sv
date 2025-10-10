class practice;
  bit [7:0] a;
  bit [7:0] b;
  bit [7:0] c;

  function new (input bit [7:0] a = 0, input bit [7:0] b = 0, input bit [7:0] c = 0);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction
endclass


module tb;
  practice f1;
  initial begin
    f1 = new (2,4,56);
    $display("a=%0d, b=%0d, c=%0d", f1.a, f1.b, f1.c);
  end
endmodule
