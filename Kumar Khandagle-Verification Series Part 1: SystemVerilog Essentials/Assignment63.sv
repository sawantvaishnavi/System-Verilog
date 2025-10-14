//1. Constraints inside the class

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  constraint data_a { a inside {[0:8]}; }
  constraint data_b { b inside {[0:5]}; }
  
endclass
 

module tb;
  
  generator g;
  int cnt = 0 ;
  
   initial begin
     g = new ();
     
     for (int i=0; i<20; i++) begin
       
       if(!g.randomize()) begin
         cnt ++;
       end
       
       $display("Value of a :%0d and b: %0d", g.a,g.b);
       #20;
     end
     
      $display("Failed Count is = %0d", cnt);
   end
endmodule
 


//2.Using  constraint outside the class

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  extern constraint data;
endclass
 
 
//////////////////Add constraint and TB top code
constraint generator::data {
  a inside {[0:8]};
  b inside {[0:5]};
};


module tb;
  generator g;
  int cnt = 0;
  
  initial begin 
    g = new ();
    
    for (int i=0; i<20; i++) begin
      if(!g.randomize()) begin
        cnt ++;
      end
      
      $display("Value of a :%0d and b: %0d", g.a,g.b);
    end
    $display("Failed Count is = %0d", cnt);
  end
endmodule
