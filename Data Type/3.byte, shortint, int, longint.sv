/* - byte, shortint, int, longint - by default they are signed data type , default value is 0.
- For out of range number it gives unkown number.
- at a time in a single code, only one $monitor can exit, if i wrote into different initial block also did not work. */

module tb();
  
  byte a_byte;
  shortint a_shortint;
  int a_int;
  longint a_longint;
  
  initial begin
    $display("At time = %0t, a_byte = 'd%0d  0x%0h",$time, a_byte, a_byte);  //by default value is 0
    //byte:  8-bit signed integer    -127 to 128;
    #10 a_byte = 2**7;
    #20 a_byte = 2**7 - 1;
    #30 a_byte = -130;  //any unknown value will be written for out of range number
    #40 a_byte = 130;
  end
  
  //shortint:  2-state, 16-bit signed integer data type. 
  initial begin
    $display("At time = %0t, a_shortint = 'd%0d  0x%0h",$time, a_shortint, a_shortint);  //by default value is 0
    //byte -127 to 128;
    #10 a_shortint = 2**15;
    #20 a_shortint = 2**15 - 1;
    #30 a_shortint = 2** 17;
    #40 a_shortint = -2**17;
  end
  
   //int:  2-state, 32-bit signed integer data type. 
  initial begin
    $display("At time = %0t, a_int = 'd%0d  0x%0h",$time, a_int, a_int);  //by default value is 0
    //byte -127 to 128;
    #10 a_int = 2**31;
    #20 a_int = 2**31 - 1;
    #30 a_int = 2**32;
    #40 a_int = -2**32;
  end
  
     //longint:  2-state, 64-bit signed integer data type. 
  initial begin
    $display("At time = %0t, a_int = 'd%0d  0x%0h",$time, a_longint, a_longint);  //by default value is 0
    //byte -127 to 128;
    #10 a_longint = 2**31;
    #20 a_longint = 2**31 - 1;
    #30 a_longint = 2**32;
    #40 a_longint = -2**32;
  end
  
  
  //only one $monitor can exist at a time, concatenating all signals into a single $monitor for the cleanest solution.
  initial begin 
    $monitor("At time %0t, a_byte = 'd%0d  0x%0h | a_shortint = 'd%0d  0x%0h | a_int = 'd%0d  0x%0h | a_longint = 'd%0d  0x%0h",$time, a_byte , a_byte, a_shortint, a_shortint, a_int, a_int, a_longint, a_longint); 
  end
  
  
  
  initial
     begin
       $dumpfile("dumb.vcd");
       $dumpvars;
       #200;
       $finish;
     end
  
endmodule
