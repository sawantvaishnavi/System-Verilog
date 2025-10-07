module tb();
  bit [7:0] a = 8'hAA;
  bit [7:0] b = 8'h55;
  
  task swap(ref bit [7:0] x, ref bit [7:0] y);
    bit [7:0] temp;
    temp = x;
    x = y;
    y = temp;
    
    $display("Inside task x=%h | y=%h",x,y);  //swaps the local copies (x, y), not the originals a and b.
    //So after the task finishes: 1.Local copies are destroyed. 2.a and b remain unchanged.
    
  endtask
  
  initial begin
    $display("Before swap: a=%0h | b=%0h ",a,b); 
   
    swap (a,b);
    $display("After swap: a=%0h | b=%0h ",a,b);
  end
endmodule
