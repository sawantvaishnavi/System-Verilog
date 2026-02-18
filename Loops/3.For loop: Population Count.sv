//Population Count - count number of 1's

module population_count (
  input logic [15:0] din,
  output logic [4:0] count);
  
  always_comb
    begin
      count = 0; //default assignment (very important bez of this latch is not infered)
      for(int i=0; i<16; i++) begin
        if(din[i])
        count = count+1 ;
      end
    end
endmodule

/// Tb 1: using urandom///
module tb();
  logic [15:0] din;
  logic [4:0] count;
  
  population_count dut (din, count);

  initial begin
    for(int i=0; i<5; i++) begin
      din = $urandom;
      #10;
      $display("din=%0b, count=%0d", din, count);
    end
  end
endmodule

/// Tb 2: using assertion  (using $countones(din) function )  //
module tb();
  logic [15:0] din;
  logic [4:0] count;
  
  population_count dut (din, count);

  initial begin
    for(int i=0; i<5; i++) begin
      din = $urandom;
      #10;
      $display("din=%0b, count=%0d", din, count);
    
    
    if(count == $countones(din)) 
      $display(" Counting is Correct!! ");
    else
      $error("mismatched");
    end
  end
endmodule


//Tb 3: using assert property //
/* Que. Why do we use ##0 in combinational assertions?
To avoid race between signal update and assertion sampling due to delta cycle scheduling. */
module tb();
  logic [15:0] din;
  logic [4:0] count;
  
  population_count dut (din, count);

  initial begin
    for(int i=0; i<5; i++) begin
      din = $urandom;
      #10;
      $display("din=%0b, count=%0d", din, count);
    end
  end
  
  assert property (@(din) ##0 count == $countones(din))
    $info("Counting is Correct!!");
    else $error("mismatched");
endmodule
