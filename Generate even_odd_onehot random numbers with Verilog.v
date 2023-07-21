//Generate even/odd/onehot random numbers with Verilog
 
 module randnum(
  input wire clk,
   output reg [7:0] random_odd,random_even, random_onehot 
);
   reg [2:0] random_value;

    initial begin
      repeat(5)begin
     // Generate random number
    random_value <= $random;
    
    // Generate random odd number
    random_odd <= random_value | 8'b00000001; //oddnumber
	#10;
    $display ("odd = %0d",random_odd);
	random_even <= random_value & 8'b11111110; //evennumber
	#10;
    $display (" even = %0d",random_even);
        
    random_onehot = 0;
	 // Generate random number
    random_value <= $random;
        $display ("rand value = %0d",random_value);  
    random_onehot[random_value] <=  1'b1; //onehot number
	#10;
        $display ("onehot = %0b",random_onehot);
  	end
  end
  
endmodule
