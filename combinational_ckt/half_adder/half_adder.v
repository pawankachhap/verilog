module half_adder(
    input x,
    input y,
    output sum,
    output carry
);

assign sum = x^y;
assign carry = x&y;

endmodule