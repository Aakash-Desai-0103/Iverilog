module halfadd(sum1,count,a,b);
input a,b;
output sum1,count;
xor(sum1,a,b);
and(count,a,b);
endmodule