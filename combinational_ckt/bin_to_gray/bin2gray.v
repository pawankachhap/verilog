// verilog module for Binary to Gray code 
// conversion (8-bit).
// Gate-level modeling

module bin2gray(
    gray,
    bin
);

output [7:0] gray;
input [7:0] bin;

assign gray[7]=bin[7];
xor G1(gray[6],bin[7],bin[6]);
xor G2(gray[5],bin[6],bin[5]);
xor G3(gray[4],bin[5],bin[4]);

assign gray[3]=bin[3];
xor G4(gray[2],bin[3],bin[2]);
xor G5(gray[1],bin[2],bin[1]);
xor G6(gray[0],bin[1],bin[0]);

endmodule