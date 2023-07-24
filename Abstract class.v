virtual class test;
  //no implementation
  pure virtual function integer send_data(bit [31:0] data);
    //pure virtual class can be declared without any implementation in abstract class
    
endclass

    class packet extends test;
      
      virtual function integer send_data(bit [31:0] data);
        $display("The value of data is %0d",data);
        data = 32'h5d;
        $display("The value of data is 0x%0h",data);
        return data;
        
      endfunction
      
    endclass
    
    module tb;
      integer r;
      packet p;
      
      initial begin 
        p=new();
        
        r=p.send_data(56);
        $display("The value of data is 0x%0h",r);
        
      end
      
    endmodule
    