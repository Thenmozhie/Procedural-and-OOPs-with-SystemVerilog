//withour virtual method in bass class: cannot access mothods of derived class using base class handle
class pack;
  integer i=1;
  
 function integer get();
    get=i; 
  endfunction
endclass

class linkpacket extends pack;
  integer i=2;
  function integer get();
    get = -i;
  endfunction
  
endclass

module tb;
  integer j;
  
   initial begin
     linkpacket lp = new();
  	 pack p = lp;
     
     j=p.i;
     $display("j=%0d",j);
     //using base class handle accessing derived class method
     j=p.get();
     $display("j=%0d",j); 
   end
endmodule