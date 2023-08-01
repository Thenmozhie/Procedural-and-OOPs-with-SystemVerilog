//Random stability, manually controlling the seed value using srandom()
class packet;
  
  rand bit [7:0] addr;
  
  function new (int seed);
    this.srandom(seed);
    
  endfunction
 
endclass

module constraint_test;
  
  initial begin
    packet pkt = new(2);
    
   // pkt.randomize();
    repeat(5) begin
      pkt.randomize();
     // $display("\taddr=%0d",pkt.addr);
      pkt.srandom(10);
      $display("\taddr=%0d",pkt.addr);
    
    end
  end
endmodule