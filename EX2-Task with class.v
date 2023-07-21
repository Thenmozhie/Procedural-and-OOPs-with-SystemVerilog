//Assume class consists of three data members a, b, and c each of size 4-bit. Create a task inside the class that returns the result of the addition of data members. The task must also be capable of sending the value of a, b, c, and result to the console. Verify code for a = 1, b = 2, and c = 4.

class d_mem;
  
  bit [3:0] a,b,c,d;
  
  task disp(input bit[3:0] a,b,c);
    d = a+b+c;  
  endtask
 
  
endclass
 
 
module tb;
 d_mem dm;
  initial begin
    dm = new();
    dm.disp(1,2,4);
    $display("d=%0d",dm.d);
  end
endmodule

 