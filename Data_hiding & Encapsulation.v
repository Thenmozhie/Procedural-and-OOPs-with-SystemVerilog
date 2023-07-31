//unqualified(without qualifiers like local,protected) class properties and methods are public, available to anyone who access to object name.

// Local - data hiding, cannot be accessible outside the class, cannot be accessible through derived class or object handle, but accessible through methods 
//proteted - Data encapsulation, cannot be accessible outside the class,can be accessible through derived class handle.

///////////////////local_example/////////////////

class packet_datahiding;
  local bit [31:0] a;
  
  function new(bit [31:0] b);
    a = b + 10;
  endfunction

  function display();
    $display("a = %0d",a);
  endfunction
endclass

/*class data_hiding extends packet_datahiding;
  
  function new(bit [31:0] b);
    super.new(b);
  endfunction
  
  function void inc();
    a++;// not accessible as a is local
  endfunction  
endclass
*/

module encapsulation;
  initial begin
  packet_datahiding p = new(57);
  //  data_hiding d=new(10);
       
    //p.a = 20;  //Accessing local/protected variable outside the class will throw error (illegal access)
    //d.inc();
    // d.display();// local/protected variable are not accessible in or throught derived class handle
     p.display();
    
  end
endmodule
//////////////end_local_example///////////////

//////////////protected example/////////////

/*
class packet_datahiding;
  protected bit [31:0] a;
  
  function new(bit [31:0] b);
    a = b + 10;
  endfunction

  function display();
    $display("a = %0d",a);
  endfunction
endclass

class data_hiding extends packet_datahiding;
  
  function new(bit [31:0] b);
    super.new(b);
  endfunction
  
  function void inc();
    a++;// accessible as a is protected
  endfunction  
endclass


module encapsulation;
  initial begin
  packet_datahiding p = new(57);
  data_hiding d=new(10);
       
    //p.a = 20;  //Accessing local/protected variable outside the class will throw error (illegal access)
    d.inc();
    d.display();// protected variable are accessible in or throught derived class/ handle
     p.display();
    
  end
endmodule
//////////////end_protected_example////////////
*/