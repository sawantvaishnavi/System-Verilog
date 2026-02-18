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

/// Tb ///
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
