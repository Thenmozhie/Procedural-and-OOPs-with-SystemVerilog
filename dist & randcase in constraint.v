class packet;
  
  rand bit [7:0] addr;
  rand byte x; 
  //:= assign same weight to all the values
  //:/ divide the wg equally among ll the values in the range
  constraint c1{addr dist {[100:102]:/1,200:=2,230:=3};} // probability of getting 100,101,102,200,230 is 1/3,1/3,1/3,2,3 respectively
  task r_case();
    //randcase introduces case statement that randomly selects one of its branches
   //usecase: % based error injection can be implemented
    randcase
    3:x=1;// 3/6
    1:x=2;// 1/6
    2:x=3;// 2/6
    endcase
  endtask
    
  
endclass

module constraint_test;
  
  initial begin
   packet pkt = new;
    
   // pkt.randomize();
    repeat(6) begin
      pkt.randomize();
      pkt.r_case();
      $display("\taddr=%0d,data=%0d",pkt.addr,pkt.x);
    
     
    end
  end
endmodule