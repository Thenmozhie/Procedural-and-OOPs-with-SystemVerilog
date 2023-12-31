//Logical equality and inequality (==,!=): the result shall be 1 bit unknown value(0,1,x)
//Case equality and inequality (===,!==): the result shall be 0 or 1
//wildcard equality and inequality (==?,!=?): the result shall be 0,1 or x [useful for ignoring x and z in RHS. Result will be x if LHS contains Z or X]
module eq_operator;
  
  initial begin
    // logical equality operator
    $display("\nlogical equality operator");
    $display("%0b",   4'b0101 == 4'b0101); // 1
    $display("%0b",   4'b0101 == 4'b0111); // 0
    $display("%0b",   4'b0101 == 4'b0x01); // x - unknown/high-z in operands
    $display("%0b",   4'b0z01 == 4'b0101); // x - unknown/high-z in operands
   
    
    // case equality operator
    $display("\ncase equality operator");
    $display("%0b",   4'b0101 === 4'b0101); // 1 - matches exactly
    $display("%0b",   4'b0101 === 4'b1111); // 0
    $display("%0b",   4'b0101 === 4'bz101); // 0
    $display("%0b",   4'b0x01 === 4'b0101); // 0
    
    // wildcard equality operator
    $display("\nwildcard equality operator");
    $display("%0b",   4'b0101 ==? 4'b0101); // 1
    $display("%0b",   4'b0101 ==? 4'b0111); // 0
    $display("%0b",   4'b0101 ==? 4'b01x1); // 1 - matches, x & z wildcard
    $display("%0b",   4'b0101 ==? 4'bzx01); // 1 - matches, x & z wildcard
    $display("%0b",   4'b0101 ==? 4'b01?1); // 1 - matches, ? can be 0,1,x,z. Since x & z are wildcard, matches
    $display("%0b",   4'b0x01 ==? 4'b1010); // x - x & z in LHS results unknown(x)
    $display("%0b", 4'b01?1 ==? 4'b0101); //x - x & z in LHS results unknown(x)
    
    // logical inequality operator
    $display("\nlogical inequality operator");
    $display("%0b",   4'b0101 != 4'b0101); // 0 - matches
    $display("%0b",   4'b0101 != 4'b0111); // 1 - Not matches
    $display("%0b",   4'b0101 != 4'b0x01); // x - unknown/high-z in operands
    $display("%0b",   4'b0z01 != 4'b0101); // x - unknown/high-z in operands
   
    
    // case inequality operator
    $display("\ncase inequality operator");
    $display("%0b",   4'b0101 !== 4'b0101); // 0 - matches exactly
    $display("%0b",   4'b0101 !== 4'b1111); // 1 - not matching
    $display("%0b",   4'b0101 !== 4'bz101); // 1
    $display("%0b",   4'b0x01 !== 4'b0101); // 1
    
    // wildcard inequality operator
    $display("\nwildcard inequality operator");
    $display("%0b",   4'b0101 !=? 4'b0101); // 0 Matching
    $display("%0b",   4'b0101 !=? 4'b0111); // 1 Not matching
    $display("%0b",   4'b0101 !=? 4'b01x1); //1
    $display("%0b",   4'b0x01 !=? 4'b0101); // x - x & z in LHS results unknown(x)
    $display("%0b", 4'b?010 !=? 4'b1010); //x - x & z in LHS results unknown(x)
    
  end
  
endmodule