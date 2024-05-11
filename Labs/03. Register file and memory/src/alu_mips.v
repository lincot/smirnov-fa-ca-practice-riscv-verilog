module alu_mips (
	input  	  [31:0] A,
	input  	  [31:0] B,
	input      [3:0]  F,
	output reg [31:0] Y
);

wire [31:0] Bmux;
wire [31:0] sumout;

assign Bmux = F[2] ? ~B : B;
assign sumout = A + Bmux + F[2];

always @ (*) begin
	case (F[1:0])
		2'b00: Y <= A & Bmux;
		2'b01: Y <= A | Bmux;
		2'b10: Y <= sumout;
		2'b11: Y <= {31'b0, sumout[31]};
	endcase
end

endmodule