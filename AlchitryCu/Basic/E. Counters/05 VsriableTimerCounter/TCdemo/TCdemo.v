// One module prescaler and counter
// Max prescaler parameter M
// Counter range parameter R
module TCdemo
#(
    parameter M = 27,
    parameter R = 3,
    parameter S = 22
)
(
    input wire clk,
    output wire [23:0] io_led,
    output wire [R:0] led
);

reg [M:0] cnt = 0;
always @(posedge clk) begin
	cnt <= cnt + 1;
end
assign io_led = cnt[M:M-23];
assign led = cnt[S+R:S];
endmodule

