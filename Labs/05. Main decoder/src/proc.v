module proc (
	input         clk,
	input  [31:0] SW,
	output [31:0] HEX
);

reg [31:0] PC = 32'b0;
reg [31:0] mux_alu;

wire [31:0] instr;
wire [31:0] CSE2;
wire   		comp_res;
wire			mux_pc;
wire [31:0] A;
wire [31:0] B;
wire [31:0] alu_res;

assign CSE2 = {{22{instr[7]}}, instr[7:0], 2'b00};
assign mux_pc = instr[31] | comp_res & instr[30];
assign HEX = A;

always @ (posedge clk)
	PC <= PC + (mux_pc ? CSE2 : 32'b100);
	
always @ (*)
	case (instr[28:27])
		2'b00: mux_alu = {{24{instr[7]}}, instr[7:0]};
		2'b01: mux_alu = SW;
		2'b10: mux_alu = alu_res;
		2'b11: mux_alu = 0;
	endcase

IM im1 (
	.A(PC),
	.RD(instr)
);

RF rf1 (
	.clk(clk),
	.A1(instr[22:18]),
	.A2(instr[17:13]),
	.A3(instr[12:8]),
	.WD3(mux_alu),
	.WE3(instr[29]),
	.RD1(A),
	.RD2(B)
);

ALU alu1 (
	.operator_i(instr[26:23]),
	.operand_a_i(A),
	.operand_b_i(B),
	.result_o(alu_res),
	.comparison_result_o(comp_res)
);

endmodule