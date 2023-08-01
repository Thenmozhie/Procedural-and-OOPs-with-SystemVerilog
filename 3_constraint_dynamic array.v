//3. Dynamic array not new'ed only size is constrained

class packet;
  rand byte addr;
  rand byte data; 
  rand bit [0:3] a[];
  constraint c1{ a.size inside {[3:5]};}
  constraint c2{ foreach(a[i]){
    a[i] inside {[7:8]};} }
 
endclass

module constraint_test;
  
  initial begin
    packet pkt = new;
    
   // pkt.randomize();
   
    assert(pkt.randomize())
      //we use %p to print unpacked data type
      $display("\taddr=%0d,data=%0d,a[]=%p",pkt.addr,pkt.data,pkt.a);
    
      else $display("Randomization failed due to unsatisfiable constraints!");
   
  end
endmodule