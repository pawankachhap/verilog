`timescale 1ns/10ps
//Program to test timing of blocking and non-blocking statements

module testing;
reg a,b;

initial begin
$monitor("[%3d]  a = %d  b = %d \n",$time,a,b);
a=0; b=0;
#1;
a = 1; b = 2;
#1;
a <= b;
b <= a;
#2;
a <= b+1;
b <= #5 20;
#1;
b <= 7;
b <= #2 4;
b <= #10 10;
b = 30;

#20;
$finish;
end
endmodule
