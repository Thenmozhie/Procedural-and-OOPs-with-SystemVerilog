module tb;
  bit [3:0] a,b;
  bit [4:0] y;
  
  bit clk = 0;
  
  always #5 clk = ~clk;  ///20 ns --> 50 Mhz (WKT, 1MHZ = 1000ns)

  ///default direction : input
  task add ();
   y = a + b;
   $display("a : %0d and b : %0d and y : %0d",a,b,y);
  endtask
  
  task stim_a_b();
    a = 1;
    b = 3;
    add();
    #10;
    a = 5;
    b = 6;
    add();
    #10;
    a = 7;
    b = 8;
    add();
    #10;
  endtask

  task stim_clk ();
    @(posedge clk);    // wait
    a =$urandom();
    b = $urandom();
    add();
  endtask
  

  initial begin
    #110;
    $finish();
  end

  initial begin
   // stim_a_b();
    for(int i = 0; i< 5 ; i++) begin
      stim_clk();
    end
  
  end

endmodule