/* Prmitive for sum and carry output of a full adder */

primitive udp_sum(sum,a,b,cin);
input a,b,cin;
output sum;

/*truth table for the sum given by full-adder*/
table
    0 0 0 : 0;
    0 0 1 : 1;
    0 1 0 : 1;
    0 1 1 : 0;
    1 0 0 : 1;
    1 0 1 : 0;
    1 1 0 : 0;
    1 1 1 : 1;
endtable
endprimitive

primitive udp_carry(carry_out,a,b,cin);
input a,b,cin;
output carry_out;

/*truth table for carry_out using don't care (?) */
table
  //a b c : carry_out
    0 0 ? : 0;    
    0 ? 0 : 0;
    ? 1 1 : 1;
    ? 0 0 : 0;
    1 ? 1 : 1;
    1 1 ? : 1;
endtable
endprimitive

/* Full adder description using the sum and carry_out UDP */

module udp_fa(
    output sum, cout;
    input a,b,cin
);

// instantiating the two UDPs
udp_sum SUM(sum,a,b,cin);
udp_carry CARRY(cout,a,b,cin);

endmodule