//1.
module tb();
  
  function bit [4:0] add(input bit [3:0]a,b);  //declare function also declare data type and size for return value
    return a+b;
  endfunction
  
  bit [4:0] res = 0;  //declare varible which can hold value generated from return
  
  initial begin
    res = add (4'b0110, 4'b0001);  // argument is passed as direct value
    $display("Value of Addition is: %0d", res);
  end
endmodule


// //2.pass argument as variable
// module tb();
    
//   function bit [4:0] add(input bit [3:0]a,b);  
//     return a+b;
//   endfunction
  
//   bit [4:0] res = 0;  
//   bit [3:0] ain = 4'b0110;
//   bit [3:0] bin = 4'b0001;
  
//   initial begin
//     res = add (ain, bin);  // pass argument as variable
//     $display("Value of Addition is: %0d", res);
//   end
// endmodule




// //3.if you added a default value you can function without argument
// module tb();
    
//   function bit [4:0] add(input bit [3:0]a=4'b0110, b=4'b0001);  //initilized a,b with default value
//     return a+b;
//   endfunction
  
//   bit [4:0] res = 0;  
  
  
//   initial begin
//     res = add ();  // function evaluated without argument
//     $display("Value of Addition is: %0d", res);
//   end
// endmodule





// //2.pass argument as variable
// module tb();
    
//   function bit [4:0] add(input bit [3:0]a,b);  
//     return a+b;
//   endfunction
  
//   bit [4:0] res = 0;  
//   bit [3:0] ain = 4'b0110;
//   bit [3:0] bin = 4'b0001;
  
//   initial begin
//     res = add (ain, bin);  // pass argument as variable
//     $display("Value of Addition is: %0d", res);
//   end
// endmodule





// //4.
// module tb();
   
//   bit [4:0] res = 0;  
//   bit [3:0] ain = 4'b0110;
//   bit [3:0] bin = 4'b0001;
  
//   function bit [4:0] add();  
//     return ain + bin;
//   endfunction
  
//   initial begin
//     res = add (); 
//     $display("Value of Addition is: %0d", res);
//   end
// endmodule


