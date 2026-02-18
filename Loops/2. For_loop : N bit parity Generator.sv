/// Method 1: Using for loop ////
module parity_generator (
  input logic [7:0]din,
  output logic parity_out);
  logic [2:0] count;
  
  always_comb  begin
    count = 0;
      for (int i=0; i<8; i++) begin
        if (din[i])
          count = count + 1;
      end
  
    parity_out = count[0];
    end
endmodule


/// Method 2: N bit using For loop ///
module parity_generator #(parameter N=8) (
  input logic [N-1:0]din,
  output logic parity_out);
  
  logic [$clog2(N+1)-1:0] count;
  
  always_comb  begin
    count = 0;
  
    for (int i=0; i<N; i++) begin
        if (din[i])
          count = count + 1;
      end
    
    parity_out = count[0];
    end
  
endmodule

///Method 3: using XOR operation//
module parity_generator #(parameter N=8) (
  input logic [N-1:0]din,
  output logic parity_out); 
  always_comb  begin
    parity_out = 0;
  
    for (int i=0; i<N; i++) begin
      parity_out ^= din[i];
      end
    end  
endmodule


/// Tb - For PARITY GENERATOR //
module parity_generator_Nbit__tb ();
   logic [7:0]din;
   logic parity_out; 
  parity_generator dut (din, parity_out);
  
  //5 random inputs
  initial begin
    for(int i=0; i<5; i++) begin
      din = $urandom;
      #10;
      $display("din=%0b, parity_out=%0b", din, parity_out);         
    end
  end  
endmodule

// Tb usinf $urandom_range ( , ) //
module parity_generator_Nbit__tb ();
   logic [7:0]din;
   logic parity_out;  
  parity_generator dut (din, parity_out);
  
  //5 random inputs
  initial begin
    for(int i=0; i<5; i++) begin
      din = $urandom_range(0, 255);
      #10;
      $display("din=%0b,din=%0d, parity_out=%0b", din, din, parity_out);   
    end
  end 
endmodule
