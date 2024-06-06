module NandGateLevel(a,b,c,w0,w1,w2);

input a,b;
output c,w0,w1,w2;

wire c1;
and(c1, a, b);
not(c, c1);

not(w0,a);
not(w1,b);
not(w2,c);

endmodule