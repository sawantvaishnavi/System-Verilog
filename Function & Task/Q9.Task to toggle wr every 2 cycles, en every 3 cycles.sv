module tb();
  
  bit clk =0;
  bit wr;
  bit en;
  
  always  #10 clk = ~clk;
  
  task toggle ();
    int count_wr =0;
    int count_en = 0;
    
    forever begin
      @(posedge clk);
      count_wr ++;
      count_en ++;
      
      if (count_wr == 2) begin
        wr = ~wr;
        count_wr = 0;
      end
      
      if (count_en == 3) begin
        en = ~en;
        count_en = 0;
      end
      
      $display("Time=%0t|wr=%0b|en=%0b",$time,wr,en);
    end
    
  endtask  
    
    initial begin
      fork
      toggle();
      join_none  
    end
    
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
    end
  initial begin
    #200 $finish;
  end
endmodule
