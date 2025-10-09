module tb;
  bit clk;
  bit en, wr;
  bit [5:0] addr;

  // Clock generation: 25 MHz → period = 40ns
  initial clk = 0;
  always #20 clk = ~clk;

  // Task to generate stimulus
  task stimulus;
    begin
      
      en   = 0;
      wr   = 0;
      addr = 0;

      
      @(posedge clk);
      en = 1; wr = 1; addr = 6'd12;

      @(posedge clk);
      addr = 6'd14;

      @(posedge clk);
      wr = 0; addr = 6'd23;

      @(posedge clk);
      addr = 6'd48;

      @(posedge clk);
      en = 0; addr = 6'd56;
    end
  endtask

  
  initial begin
    stimulus();
    #100 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
