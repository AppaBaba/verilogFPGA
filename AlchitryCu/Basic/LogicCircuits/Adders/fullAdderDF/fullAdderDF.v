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

fullAdderDF fulladder
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


// Verilog Data Flow Full Adder
module fullAdderDF(a,b,cin,sum,carry);
input  a,b,cin;
output wire carry,sum;
assign {carry,sum}=a+b+cin;
endmodule