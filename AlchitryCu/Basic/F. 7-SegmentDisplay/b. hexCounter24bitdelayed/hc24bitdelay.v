// A 24bit delayed, 32bit hexadecimal counter
// With reset

module hc24bitdelay(
    input clk,
    input notrst,
    output reg [7:0]seg,
    output reg [3:0]an
    );

reg [40:0] ps = 0;          // prescaler register
reg [1:0] cn;               // 2bit counter register
reg [3:0] hex, h0,h1,h2,h3; // hexadecimal registers
reg reset;

always @(posedge clk)
begin
reset = !notrst;
  if (reset)
    ps = 0;
  else begin
    ps <= ps + 1;
    cn = ps[18:17];          // bits for counter
    h0 = ps[28:25];          // bits for hexadecimal register 0
    h1 = ps[32:29];          //          .                    1
    h2 = ps[36:33];          //          .                    2
    h3 = ps[40:37];          //          .                    3
  end
end

 always @(*)
 begin
     case (cn)
         2'b00:
         begin
             an = 4'b1110;
             hex = h0;
         end
         2'b01:
         begin
             an = 4'b1101;
             hex = h1;
         end
         2'b10:
         begin
             an = 4'b1011;
             hex = h2;
         end
         2'b11:
         begin
             an = 4'b0111;
             hex = h3;
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
            seg = 8'b01001001;  // five
        4'b0110:
            seg = 8'b01000001;  // six
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
