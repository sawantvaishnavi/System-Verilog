module tb;
  
  reg a=1'b0;
  reg b=1'b0;
  reg rst;
  reg c=1'b1;
  
  
  
  initial begin
    $assertoff();
     a=1'b0;
    #50;
    $asserton();
     a=1'b1;
  end
  
  always #10 b= ~b;
  initial begin
    $assertoff ();
    #50;
    $asserton();
  end
  
  initial begin
    c=0;
    #40;
    c=1;
  end
  
  initial begin 
    rst = 1;
    #60;
    rst = 0;
  end
    
  
  always@(*) begin 
    A1: assert (a == 1'b1) $info("Sucess A1 at %0t", $time); else $error("Fail A1 at %0t", $time);
  end
  //if a1 and a2 are in same always block different answers are coming
  always@(*) begin
    A2: assert (b == 1'b1)  $info("Sucess A2 at %0t", $time); else $error("Fail A2 at %0t", $time);
  end
  
  Selectively disabling assertion using if in simple immediate assertion
  always@(*) begin
    if (rst == 1)
    A3: assert (c== 1'b1) $info("Sucess A3 at %0t", $time); else $error("Fail A3 at %0t", $time);
  end
  
  //deffered immediate assertion
   always@(*) begin
    A3: assert final (c== 1'b1) $info("Sucess A3 at %0t", $time); else $error("Fail A3 at %0t", $time);
     
     if (rst == 1)
       disable A3;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100;
    $finish;
  end
  
endmodule
