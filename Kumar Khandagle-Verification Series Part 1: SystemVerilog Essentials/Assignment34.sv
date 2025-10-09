module tb ();
int d_array[];

  initial begin
  d_array = new[7];
    for(int i=0; i<=$size(d_array);i++) begin
      d_array[i] = 7*(i+1);
    end

    $display("d_array= %0p",d_array);
    d_array = new[20](d_array);

    for(int i=7; i<$size(d_array);i++) begin
      d_array[i] = (i-6)*5;
    end

    $display("d_array= %0p",d_array);

  end
endmodule
