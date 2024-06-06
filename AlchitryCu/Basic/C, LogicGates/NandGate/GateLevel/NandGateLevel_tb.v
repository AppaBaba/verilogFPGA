module NandGateLeveltb;
reg A,B;
wire C;
NandGateLevel dut(.a(A), .b(B), .c(C));
initial
begin
#5 A =0; B=0;
#5 A =0; B=1;
#5 A =1; B=0;
#5 A =1; B=1;
end
initial
begin
$monitor("simtime = %g, A =%b, B =%b, C =%b", $time,A,B,C);
end
endmodule