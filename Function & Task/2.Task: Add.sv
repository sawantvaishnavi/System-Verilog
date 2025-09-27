
//1.
module tb();
  
  task add(input bit [3:0] a, input bit [3:0] b, output bit [4:0] y);
    y = a+b;
  endtask
  
  bit [3:0] a,b;
  bit [4:0] y;
  
  initial begin
    a = 5;   //a, b value initilization
    b = 5;
    
    add(a,b,y);    //invoke the task
      
      $display("Value of y : %0d",y);  
  end
  
endmodule





//2.Variable declared before task
module tb();
  
  bit [3:0] a,b;  
  bit [4:0] y;
  
  task add();  //when variable declared first task understand we will work on above variable only so no need to give as argument
    y = a+b;
  endtask
  
 
  
  initial begin
    a = 5;   
    b = 5;
    
    add();    
      
      $display("Value of y : %0d",y);  
  end
  
endmodule




//3.Task with timing control #
module tb();
  
  bit[3:0] a,b;
  bit [4:0]y;
  
  task add();
    y = a + b;
    $display("value of a: %0d, value of b: %0d and value of y: %0d", a,b,y);
  endtask
  
  task time_sim();
    a = 3;
    b = 6;
    add ();
    #10;
    a = 1;
    b = 4;
    add ();
    #10;
    a = 12;
    b = 9;
    add ();
  endtask
  
  initial begin
    time_sim (); 
  end
  
    
endmodule





//4.task with Timing control @
module tb();
  
  bit [3:0] a,b;
  bit [4:0] y;
  
  bit clk = 0;
  always #10 clk = ~clk;  //time period 20ns
  
  
  task add();
    y = a + b;
    $display("Value of a: %0d, b: %0d and y: %0d",a,b,y);
  endtask
  
  task sim_clk ();
    @(posedge clk);
    a = $urandom();
    b = $urandom();
    add();
  endtask
  
  initial begin
    #200;
    $finish;
  end
  
  //if inside inital block if u keep sim_clk(); only once it will invoke task, lets add for loop and check value till the $finish time come
  initial begin
    for(int i=0; i<20; i++) begin
      sim_clk();
    end
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule
