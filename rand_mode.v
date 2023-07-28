//rand_mode is use to turn on or off the effects of randomization on the individual property of particular call.
//rand_mode(0) will turn off effect of randomization but does not turn off contraints on that variable, causing the method to behave as a checker
//rand_mode(1) will turn_on the randomization.

class packet;
  rand byte address;
  rand byte data; 

endclass

module rand_mode_methods;
  initial begin
    packet pkt = new();
    
    $display("address.rand_mode() = %0d \t data.rand_mode() = %0d",pkt.address.rand_mode(),pkt.data.rand_mode());
    
    //disable rand_mode of object
    pkt.rand_mode(0);
    
    //calling randomize method
    assert( pkt.randomize());
    
    $display("addr = %0d \t data = %0d",pkt.address,pkt.data);
    
    $display("address.rand_mode() = %0d \t data.rand_mode() = %0d",pkt.address.rand_mode(),pkt.data.rand_mode());
  end
endmodule