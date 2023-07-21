// Code your testbench here
// or browse Examples
module tb;
  
  int arr[10];///0-9
  int i =0;
 
  /*
  initial begin
    
    for(i= 0; i< 10; i++) begin
      arr[i] = i;    
    end
    
    
    $display("arr : %0p", arr);
    
    
  end
  
  */
  
  /*
  initial begin
    
  foreach(arr[j]) begin //0---9
    arr[j] = 5;
    $display("%0d", arr[j]);
  end
    
  end
  */
  
  initial begin
    
    repeat(10) begin
      arr[i] = i;
      i++;
    end
    
    $display("arr : %0p",arr);
    
  end
  
  
  
endmodule