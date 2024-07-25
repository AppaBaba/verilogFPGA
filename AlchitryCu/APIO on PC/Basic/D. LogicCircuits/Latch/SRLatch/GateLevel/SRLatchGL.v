module SRLatchGL(q,notq);
output q, notq;
wire r;
wire s;
assign r = 1'b1; // reset
assign s = 1'b0; // set
// RSlatch
nor(q, r, notq);
nor(notq, s, q);
endmodule