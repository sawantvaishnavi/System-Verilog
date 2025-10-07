module tb();
  function bit [7:0] binary_to_gray(input bit [7:0] in);
    
    bit [7:0] temp;
    temp[7] = in[7];
    
    for(int i=7;i>0;i--) begin
      temp[i-1] = in[i] ^ in[i-1];
    end
    return temp;
  endfunction
  
  initial begin
    bit [7:0] results =  binary_to_gray(8'b10001001);
    $display("Binary to gray conversion is:v%0b",results);
  end
  
endmodule
