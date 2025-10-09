class first;
bit [7:0] d1;
bit [7:0] d2; 
bit [7:0] d3;
endclass

module tb;
  first a;
    initial begin
      
        a = new(); // Instantiate the object
        a.d1 = 8'd45; // Assign values to class members
        a.d2 = 8'd78;
        a.d3 = 8'd90;
        #1;

        $display("Values are: %0d, %0d, %0d", a.d1, a.d2, a.d3); // Display the values

    end
endmodule
