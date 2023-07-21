//Generate active low reset sequence using 1 reset signals as following
// reset asserts at 0 ns deasserts at 15ns
// reset asserts at35ns and deasserts at 48ns
// reset asserts at 100ns and deasserts at 200ns
module reset_seq_TB;

  reg rst;

  initial begin
    rst =0;
#15;
rst =1;
#20;
rst =0;
#13;
rst =1;
#52;
rst =0;
#100;
rst =1;
    
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #300 $finish;
  end

endmodule

