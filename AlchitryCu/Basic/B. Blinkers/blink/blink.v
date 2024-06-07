
module blink
(
  input clk,
  output LED
);

  reg [25:0] cnt;
  assign LED = ~cnt[23];
  initial begin
    cnt = 0;
  end

  always @(posedge clk)
  begin
    cnt <= cnt + 1;
  end
endmodule
