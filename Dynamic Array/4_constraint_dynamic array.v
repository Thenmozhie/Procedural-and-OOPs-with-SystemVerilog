//4. Dynamic array new'ed in constructor. Also size constrained with x. Use  size>x,size<x

class dyna_array_c;

    rand int unsigned da[];	 
  rand int unsigned x;
  constraint c1{ da.size inside {[3:11]};}
  constraint c{x inside {[2:9]};}
 
    function new();
        da = new[5];    
    endfunction	    

endclass	

module dyn_array;

  dyna_array_c da_h;

  initial begin
      da_h = new();
          
      $display("Before randomization, da size: %d", da_h.da.size());
    assert(da_h.randomize() with {da.size > x;});
      $display("After randomization, da size: %d", da_h.da.size());

      $display("Before randomization, da size: %d", da_h.da.size());
    assert(da_h.randomize() with {da.size < x;});
      $display("After randomization, da size: %d", da_h.da.size());

  end 	  

endmodule