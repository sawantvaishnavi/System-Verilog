module tb();
  int fixed_arr [20];
  int new_que[$];
  
  initial begin

    foreach (fixed_arr[i]) begin
      fixed_arr[i] = $urandom;
    end
    $display("Fixed_arr=%0p", fixed_arr);



    foreach(fixed_arr[i]) begin

      new_que.push_front(fixed_arr[i]);
    end
    $display("new_que=%0p", new_que);
    
    //or   
//   for(int i=0; i<20; i++) begin
//     new_que[i] = fixed_arr[19 - i];
//   end
//     $display("new_que=%0p", new_que);

  end
endmodule
