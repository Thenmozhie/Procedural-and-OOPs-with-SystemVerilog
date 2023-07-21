// Code your testbench here
// or browse Examples
module tb;
  
  reg [7:0] A[15];
  reg [7:0] B[15];
 int i,j=0;
    
  
  initial begin
    
	 repeat(15) begin
    A[i] = $urandom; i++;
       
    end
 
    
    for (i=0; i<15 ; i++) begin

      $write("A : %0d ",A[i]);
  	end 
    
       
    repeat(15) begin
      B[j] = $urandom; j++;
       
    end
    
    for (j=0; j<15 ; j++) begin

      $write (" B : %0d ",B[j]);
  	end
  
  end
endmodule