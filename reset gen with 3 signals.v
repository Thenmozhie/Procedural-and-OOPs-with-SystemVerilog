//Generate active low reset sequence using 3 reset signals as following
// First reset asserts at 0 ns deasserts at 15ns
// Second reset asserts at35ns and deasserts at 48ns
// Third reset asserts at 100ns and deasserts at 200ns
module reset_tb;

  reg rst1 =1, rst2=0, rst3=0;

  initial begin
     #15 rst1 = 0; 
  end

  initial begin
    #35 rst2 = 1; 
    #13 rst2 = 0; 
  end

  initial begin
    #100 rst3 = 1;
    #100 rst3 = 0; 
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #300 $finish;
  end

endmodule