// 4321 test hexadecimal
// 16bit prescaler
// 2bit counter
// hexadecimal to four 7-segment display
module hexnum(
    input clk,
    output reg [7:0]seg,
    output reg [3:0]an
    );

reg [18:0] ps = 0;
reg [1:0] cnt;
reg [3:0] hex;

always @(posedge clk)
begin
  ps <= ps + 1;
  cnt = p[18:17];
end

 always @(*)
 begin
     case (cnt)
         2'b00:
         begin
             an = 4'b1110;
             hex = 4'b0001;
         end
         2'b01:
         begin
             an = 4'b1101;
             hex = 4'b0010;
         end
         2'b10:
         begin
             an = 4'b1011;
             hex = 4'b0011;
         end
         2'b11:
         begin
             an = 4'b0111;
             hex = 4'b0100;
         end
     endcase
 end


always @(*) begin
    case (hex)
        4'b0000:
            seg = 8'b00000011;  // zero
        4'b0001:
            seg = 8'b10011111;  // one
        4'b0010:
            seg = 8'b00100101;  // two
        4'b0011:
            seg = 8'b00001101;  // three
        4'b0100:
            seg = 8'b10011001;  // four
        4'b0101:
            seg = 8'b01001001;  //five
        4'b0110:
            seg = 8'b01000001;  //six
        4'b0111:
            seg = 8'b00011111;  // seven
        4'b1000:
            seg = 8'b00000001;  // eight
        4'b1001:
            seg = 8'b00001001;  // nine
        4'b1010:
            seg = 8'b00010001;  // A
        4'b1011:
            seg = 8'b11000001;  // b
        4'b1100:
            seg = 8'b01100011;  // C
        4'b1101:
            seg = 8'b10000101;  // d
        4'b1110:
            seg = 8'b01100001;  // E
        4'b1111:
            seg = 8'b01110001;  // F
    endcase
end
endmodule
