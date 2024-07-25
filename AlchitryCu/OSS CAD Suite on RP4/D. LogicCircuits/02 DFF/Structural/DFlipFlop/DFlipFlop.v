module DFlipFlop(q, notq, clk, d);
   output q;
   output notq;
   input  clk;
   input  d;

   wire   cn;   // Control input to the D latch.
   wire   cnn;  // Control input to the SR latch.
   wire   dq;   // Output from the D latch, input to the gated SR latch.
   wire   dqn;  // Output from the D latch, input to the gated SR latch.
   
   not(cn, clk);
   not(cnn, cn);   
   Dlatch dl(dq, dqn, cn, d);
   SRlatch sr(q, notq, cnn, dq, dqn);   
endmodule

module Dlatch(q, notq, gate, d);
   output q;
   output notq;
   input  gate;   
   input  d;

   wire   notd;
   wire   d1;
   wire   notd1;

   not(notd, d);   
   and(d1, gate, d);
   and(notd1, gate, notd);   
   nor(notq, d1, q);
   nor(q, notd1, notq);
endmodule

module SRlatch(q, notq, gate, s, r);
   output q;
   output notq;
   input  gate;   
   input  s;
   input  r;

   wire   s1;
   wire   r1;
   
   and(s1, gate, s);
   and(r1, gate, r);   
   nor(notq, s1, q);
   nor(q, r1, notq);
endmodule