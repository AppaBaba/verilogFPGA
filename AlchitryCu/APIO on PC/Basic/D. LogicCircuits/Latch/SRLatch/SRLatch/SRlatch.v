module SRlatch(q,notq);
    //input wire s, r;
    output wire q, notq;
    wire s, r;
    assign s = 1'b1;
    assign r = 1'b0;
    // SRlatch
    assign q     = ~(r | notq);
    assign notq  = ~(s | q);
    
endmodule