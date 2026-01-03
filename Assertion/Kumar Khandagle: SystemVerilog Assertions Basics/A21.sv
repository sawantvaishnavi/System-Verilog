///////////////////Design Code:



module adder(
  input      [3:0] a,b,
  output reg [4:0] s
);
  
  
  always@(*)
    begin
      s = a + b;
    end
 
  always@(*)
    begin
      assert (s==a+b) $info ("Pass"); else $error("Fail");
    end
    
  
endmodule
  
 


///////////////TB code



module tb;
  
  reg [3:0] a, b;
  wire [4:0] s;
  
  adder dut (a, b, s);
  
  initial begin
    for(int i = 0; i < 10; i++) begin
      a = $urandom;
      b = $urandom;
      #10;
    end   
  end
  
  
   initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    $assertvacuousoff(0);
    #110;
    $finish();
  end
  
  
endmodule
