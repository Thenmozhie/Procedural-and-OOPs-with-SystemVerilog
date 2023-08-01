//4 experiments needed here:
//1. Dynamic array randomized without new or size constraint - compiler error to specify the size
//2. Dynamic array new'ed in constructor and randomized without constraints on size - size of the dynamic array are specified through function new, so size constraint is not needed.(no error)
class packet;
  rand byte addr;
  rand byte data; 
  rand int x,y;
  rand bit [0:3] a[];
 // constraint c1{ a.size inside {[3:5]};}

  constraint c2{ foreach(a[i]){
    a[i] inside {[7:8]};} }
    
    function new();
         a=new[5];
    endfunction
                
endclass

module constraint_test;
  
  initial begin
    packet pkt = new();
    
   // pkt.randomize();
   
    assert(pkt.randomize())
      //we use %p to print unpacked data type
      $display("\taddr=%0d,data=%0d,a[]=%p",pkt.addr,pkt.data,pkt.a);
    
      else $display("randomization failed due to unsatisfiable constraints!");
   
  end
endmodule