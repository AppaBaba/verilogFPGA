module Wires
(
  output S, C
);

wire w0,w1,w2,w3;
assign S = w2;
assign C = w3;
Probe Ptest
(
  .A(w0),
  .B(w1)
);

halfAdderDF halfadder
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


// Verilog Data Flow Half Adder
module halfAdderDF(a, b, s, c);
input a,b;
output s,c;
assign {c,s}=a+b;                                
endmodule