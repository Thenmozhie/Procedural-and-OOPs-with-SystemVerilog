//generate programmable clock with configurable frequency in three different ways

`timescale 1ns/1ps  // defining time unit and precision

module clk_gen1;
  reg clk =0;
  parameter freq = 800000000; 
  real period = 1e9/freq; // converting to ns
  
  initial begin

    forever 
      #(period/2) clk = ~clk; // generate clock
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #300;
    $finish;
  end
endmodule
-------------------------
`timescale 1ns/1ps  // defining time unit and precision

module clk_gen2;
  reg clk =0;
  parameter freq = 800000000; 
  real period = 1e9/freq; // converting to ns
  

 always #(period/2) clk = ~clk; // generate clock


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #300;
    $finish;
  end
endmodule
----------------

module clk_gen3;
  reg clk =0;
  parameter freq = 800000000; 
  real period = 1e9/freq; // converting to ns
  
  initial begin

    repeat(10) forever 
      #(period/2) clk = ~clk; // generate clock
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #300;
    $finish;
  end
endmodule