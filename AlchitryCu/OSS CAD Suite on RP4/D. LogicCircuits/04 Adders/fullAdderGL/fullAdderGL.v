module Wires
(
  output S, C
);

wire w0,w1,w2,w3,w4;
assign S = w3;
assign C = w4;
Probe Ptest
(
  .A(w0),
  .B(w1),
  .Cin(w2)
);

fullAdderGL fulladder
(
  .a(w0),
  .b(w1),
  .cin(w2),
  .sum(w3),
  .carry(w4)
);
endmodule

module Probe(A, B, Cin);
output reg A, B, Cin;
  
// Testing
     initial begin
       // Apply inputs.
         A   = 1'b0;
         B   = 1'b1;
         Cin = 1'b0;
     end
endmodule


// Verilog Gate Level Full Adder
module fullAdderGL(a,b,cin,sum,carry);

input  a,b,cin;
output carry,sum;
wire s1,c1,c2;

xor x1(s1,a,b);
and a1(c1,a,b);
xor x2(sum,s1,cin);
and a2(c2,s1,cin);
or o1(carry,c1,c2);

endmodule