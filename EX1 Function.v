//Create a function that will perform the multiplication of the two unsigned integer variables. Compare values return by function with the expected result and if both values match send "Test Passed" to Console else send "Test Failed".

module tb;
  integer unsigned a =4;
  integer unsigned b =4;
     
  function integer unsigned mul(input integer unsigned a, b);
    return a*b;
  endfunction
 
    
  initial begin
   integer unsigned c;
    c=mul(a,b);
    $display ("c = %0d",c);
 	
    if(c==(a*b)) 
      $display("Test Passed");
    else 
      $display("Test Failed");
   
 end 
endmodule