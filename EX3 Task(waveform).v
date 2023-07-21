//Create a task that will generate stimulus for addr , wr, and en signal as mentioned in a waveform of the Instruction tab. Assume address is 6-bit wide while en and wr both are 1-bit wide. The stimulus should be sent on a positive edge of 25 MHz clock signal.


module tb;
    bit [5:0] addr;
    bit wr = 0;
  bit en = 0;
  bit clk = 0;
    
    always #20 clk= ~clk;
      
      task sti(input bit[5:0] address);
    	@(posedge clk);
    	addr = address;	
   	  endtask
   
   initial begin
      @(posedge clk);
      en=1;
      wr=1;
      #80;
      en=1;
      wr=0;
      #80;
      en=0;
      wr=0;
      #40;
   end
   
  initial begin
  
    sti(12); sti(14); sti(23); sti(48); sti(56); 
    end
    
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
 
    initial begin #200; $finish;
    end
    
    
endmodule
  
  