module tb;
  
  function void thread(int i,j);
    $display("thread %0d, %0d",i,j);
  endfunction
  
  initial begin 
    for (int i=0;i<4;i++) begin
      automatic int j=i;
      
      fork
        thread (i,j);
      join_none
      
    end
  end
  
endmodule