/////////// Design////////////

interface dff_if;
  logic clk;   //clock signal
  logic rst;   //reset signal
  logic din;   //input to dff
  logic dout;  //output of dff
endinterface


//Defining port signals using interface
module dff (dff_if vif);
  
  always@(posedge vif.clk) begin
    if(vif.rst == 1)
      vif.dout <= 1'b0;
    else if (vif.din === 1'bx)
      vif.dout <= 1'b0;
    else
      vif.dout <= vif.din;
  end
endmodule


//////////Testbench/////////

//In Transaction: List all signals relevant to one transaction
//Here we need, (din, dout) in one transaction
class transaction;
  rand logic din;
  logic dout;
  
  function transaction copy();
    copy = new();
    copy.din = this.din;
    copy.dout = this.dout;
  endfunction
  
  function void display(input string tag);
    $display("[%0s]: Din:%0b Dout:%0b", tag, din, dout);
  endfunction
endclass


//Create generator
//Purpose of generator to create input data (transactions) to send to driver and scoreboard
class generator;
  
  transaction tr;  //defining transaction object
  
  mailbox #(transaction) mbx;  //creating mailbox to send data to driver
  mailbox #(transaction) mbxref; //creating mailbox to send data to scoreboard for comparision --> "GOLDEN DATA"
  
  event sconext; // event that will sense the completion of scoreboard work
  event done;  //event to trigger when the requested number of stimuli is applied
  
  int count; //stimulus count
  
  function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
    this.mbx = mbx;
    this.mbxref = mbxref;
    tr = new(); 
  endfunction
  
  task run();
    repeat(count) begin 
      tr.din = 1'bx;
      
      mbx.put(tr.copy); //Put a copy of the transaction into the driver mailbox
      mbxref.put(tr.copy); //Put a copy of the transaction into the scoreboard mailbox
      //“Take the data from tr, create a duplicate transaction object, and send that duplicate into the mailbox mbxref.”
      //“tr.copy is telling — go to the transaction class, execute the copy() function, make a new object with same data, and return it, then put it into mailbox.”
      
      tr.display("GEN"); //display  generator transaction information 
      @(sconext); // Wait for the scoreboard's complets its process before generating new stimulus
    end
    ->done; // Trigger "done" event when all stimuli are applied
    
  endtask
endclass



//Creata Driver
//Primary object- Receive data from Generator and apply it to DUT using interface
class driver;
  
  transaction tr; //transaction object to store the data received from generator
  mailbox #(transaction) mbx;
  
  virtual dff_if vif; //Virtual interface to dut -- Because of the virtual interface, we can access and control the signals inside the interface from a class (like driver or monitor).
  
  //We add a custom constructor where we specify an argument indicating the mailbox working between the generator and driver.
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  //WE have two task in driver
  //1. RESET Task: reset the dut
  //2. Apply Stimulus received from generator to DUT
  
  task reset();
    vif.rst <= 1'b1;  //Apply reset signal
    repeat(5)@(posedge vif.clk)   //wait for 5 clock cycles -- Asser reset for 5 clock cycles
    vif.rst <=1'b0;   //Deassert reset Signal
    @(posedge vif.clk)  //wait for one more clock cycle
    $display("[DRV] : RESET DONE");   //Display Reset completion msg 
  endtask
  
  task run();
    forever begin
      mbx.get(tr);  //get transaction from generator
      vif.din <= tr.din; //he driver takes the din value stored in the transaction (tr.din) and drives it onto the DUT’s input port (vif.din).
      @(posedge vif.clk) //Wait one posedge of clk
      tr.display("DRV");
      vif.din <= 1'b0;  //set dut input to zero
      @(posedge vif.clk) ;  //Wait for one more posedge of clk    
    end
  endtask
  
endclass

//Create Monitor
//Purpose is to read output from dut and send to scoreboard
//The monitor acts as a passive observer — it never drives signals to the DUT, it only captures and reports them.
//Monitor reads the DUT’s output (vif.dout)
//Puts that data inside a transaction object (tr)
class monitor;
  transaction tr;
  mailbox #(transaction) mbx;  //create mailbox to send from DUT to scoreboard
  virtual dff_if vif;   //virtual interface for dut
  
  function new (mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    tr = new();  // Create a new transaction
    forever begin
      repeat(2)@(posedge vif.clk); // Wait for two rising edges of the clock  \\in driver we are using 2 clock cycles, so here we are waiting for 2 clock cycles
      tr.dout = vif.dout; //Capture dut output
      //store the response in the respective data member of the transaction.Now, since the transaction belongs to object-oriented programming, we need to use a simple equals operator. 
      
      mbx.put(tr); //Sends data from monitor to scoreboard
      tr.display("MON");
    end
  endtask
  
endclass
  


//The scoreboard’s job is to compare what the DUT actually produced  vs. what we expected based on the known behavior.
class scoreboard;
  
  transaction tr;
  transaction trref;
  
  mailbox #(transaction) mbx;
  mailbox #(transaction) mbxref;
   
  event sconext;
  
  function new (mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
    this.mbx = mbx;
    this.mbxref = mbxref;
  endfunction
  
  task run;
    forever begin
    mbx.get(tr);
    mbxref.get (trref);
    
    tr.display("SCO");     //Method to receive data from Monitor
      trref.display("REF");  //Method to receive data from generator
    
      if (trref.din === 1'bx && tr.dout === 1'b0)
      $display("[SCO] : Test Passed - DOUT=0 is valid for DIN=X");
    else if (tr.dout === trref.din)
      $display("[SCO] : Test Passed - Data Matched");
    else
      $display("[SCO] : Test Failed - Data Mismatched");
    $display("-------------------------------------------------");
    -> sconext;
    end
  endtask
  
endclass


class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  event next;
  
  mailbox #(transaction) gdmbx;  //gen to drv
  mailbox #(transaction) msmbx;   //mon to sco
  mailbox #(transaction) mbxref;   //gen to sco
  
  virtual dff_if vif;
  
  function new (virtual dff_if vif);
    gdmbx = new(); //Create a mailbox for generator-driver communication
    msmbx = new ();  //Create a mailbox for generator-scoreboard reference data
    mbxref = new();  //// Create a mailbox for monitor-scoreboard communication
    
    gen = new(gdmbx, mbxref);  // Mailbox: gen to driver, gen to sco
    drv = new(gdmbx);
    mon = new(msmbx);
    sco = new(msmbx, mbxref);
    
    
    this.vif = vif; // Set the virtual interface for DUT
    drv.vif = this.vif;   // Connect the virtual interface to the driver
    mon.vif = this.vif;   // Connect the virtual interface to the monitor
    
    gen.sconext = next;  // Set the communication event between generator and scoreboard
    sco.sconext = next;  // Event to signal communication between generator and scoreboard
       
  endfunction
  
  task pre_test ();
    drv.reset ();
  endtask
  
  task test;
    fork
      gen.run(); // Start generator
      drv.run(); // Start driver
      mon.run(); // Start monitor
      sco.run(); // Start scoreboard
    join_any
  endtask
  
  task post_test();
    wait(gen.done.triggered);
    $finish;
  endtask
  
  task run();
    pre_test();
    test();
    post_test();
  endtask
endclass
  


module tb();
  dff_if  vif ();    // Create DUT interface
  dff dut (vif);     //instantiate dut
  
  initial begin
    vif.clk <= 0;
  end
    
  always #10 vif.clk = ~vif.clk;
  
  environment env;
  
  initial begin
    env = new(vif);
    env.gen.count = 30;
    env.run();
  end
  
  initial begin
    $dumpfile("dump.vcd"); // Specify the VCD dump file
    $dumpvars; // Dump all variables
  end
  
endmodule
