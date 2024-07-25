module Wires(s,c);
output s,c;

wire w0,w1,w2,w3;
assign s = w2;
assign c = w3;

Probe Ptest
(
  .A(w0),
  .B(w1)
);

halfAdderGL halfadder
(
  .a(w0),
  .b(w1),
  .s(w2),
  .c(w3)
);

endmodule

module Probe(A, B);
output reg A, B;
  
// Testing
     initial begin
       // Apply inputs.
         A = 1'b0;
         B = 1'b1;
     end
endmodule


// Verilog Gate Level Half Adder
module halfAdderGL(a,b,s,c);
input a,b;
output s,c;
xor(s,a,b);
and(c,a,b);
endmodule
