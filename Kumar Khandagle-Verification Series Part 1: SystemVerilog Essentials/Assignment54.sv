module tb();
  
  function automatic void a_54 ( output int arr[32]);
    for(int i=0; i<32; i++) begin
      arr[i] = 8*i;
    end
  endfunction
  
  int local_copy[32];
  
      initial begin
        a_54(local_copy);
        
        for (int i=0; i<32; i++) begin
          $display("Element[%0d] = %0d", i, local_copy[i]);
        end
      end
  
endmodule
