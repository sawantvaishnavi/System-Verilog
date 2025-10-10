class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function generator copy();
    copy = new();
    copy.a = a;
    copy.b = b;
    copy.wr = wr;
    copy.en = en;
    copy.s = s;
  endfunction
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
 
endclass

module tb();
  
  initial begin
    generator g1 = new();
    g1.display("Original g1: ");
    
    generator g2 = g1.copy();
    g2.display("Copied g2: ");
    
    g1.a= 9;
    g1.b = 10;
    g1.wr = 0;
    g1.en = 0;
    g1.s = 11;
  end
  
endmodule
