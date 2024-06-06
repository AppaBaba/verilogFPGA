module fastcounter
(
    input wire clk,
    output wire [7:0] LED
);
reg [7:0] c = 0;
always @  (posedge clk)
begin
    c <= c + 1;
end
assign LED = c;
endmodule