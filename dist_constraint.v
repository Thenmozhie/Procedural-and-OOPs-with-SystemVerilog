class packet;
  rand bit [7:0] addr;
  rand byte data; 
  //:= assign same weight to all the values
  //:/ divide the wg equally among ll the values in the range
  constraint c1{addr dist {[100:102]:/1,200:=2,230:=3};} // probability of getting 100,101,102,200,230 is 1/3,1/3,1/3,2,3 respectively
endclass

module constraint_test;
  
  initial begin
   static packet pkt = new;
    
   // pkt.randomize();
    repeat(6) begin
    assert(pkt.randomize())
      $display("\taddr=%0d,data=%0d",pkt.addr,pkt.data);
    
      else $display("Randomization failed due to unsatisfiable constraints!");
    end
  end
endmodule