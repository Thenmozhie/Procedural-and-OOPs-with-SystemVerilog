//Inheritance promotes functionality reuse; how to inherit? extends keyword; how to access inheritance? 'this';
//Inheritance - perspective of polymorphism
//Inheritance allows reuse & enhance the functionality of base class in 2 ways: 
//1- add new methods and properties which gives new capability to functionatity in base class;
//2- Override the existing methode, using 'super' adding additional enhancement

class first;  ///parent class
  
  int data = 12;//base class property
  
  virtual function void display();
     $display("FIRST : Value of data : %0d", data);
  endfunction
  
 
  
endclass
 
 
class second extends first; //child class
  
  int temp = 34; //derived class property

 //1- add new methods and properties which gives new capability to functionatity in base class; 
  
function void add();
    $display("secomd:Value after process : %0d", temp+4);
  endfunction
  
 
  function void display();
    $display("SECOND : Value of data : %0d", data);
  endfunction

  
endclass
 
 
module tb;
  
  first f;
  second s;
  
  
  initial begin
    f = new();
    s = new();
    
    f = s;
    s.add();
    
  end
  
 
  
endmodule