// Code your testbench here
// or browse Examples
module tb;
  bit [1:0] a;
  bit [1:0] b;
  /*
//////pass by value
  
  task swap ( input bit [1:0] a, [1:0] b); 
    bit [1:0] temp;
    temp = a;
    a = b;
    b = temp;   
    $display("Value of a : %0d and b : %0d", a,b);
  endtask
*/  
 /* 
  //////pass by reference
  
  task automatic swap( ref bit [1:0] a, ref bit [1:0] b);
  int temp;
    temp = a;
    a = b;
    b = temp;
    
    $display("Value of a : %0d and b : %0d", a,b);
  endtask
*/
  ////restrict access to variables 
  task automatic swap (const ref bit [1:0] a, ref bit [1:0] b); 
    bit [1:0] temp;
    
    temp = a;
  //  a = b; //here function is capable of changing the vale of a but not the value of b
    b = temp;
    
    $display("Value of a : %0d and b : %0d", a,b);
  endtask
  
  initial begin
    a = 1;
    b = 2;
    
    swap(a,b);
    
    $display("Value of a : %0d and b : %0d", a,b);
  end
  
  
endmodule