module alu_riscv (
	input      [5:0]  operator_i,
	input      [31:0] operand_a_i,
	input      [31:0] operand_b_i,
	output reg [31:0] result_o,
	output reg        comparison_result_o
);

always @ (*)
	case (operator_i)
		6'b011000: begin
			result_o = operand_a_i + operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b011001: begin
			result_o = operand_a_i - operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b101111: begin
			result_o = operand_a_i ^ operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b101110: begin
			result_o = operand_a_i | operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b010101: begin
			result_o = operand_a_i & operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b100100: begin
			result_o = $signed(operand_a_i) >>> operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b100101: begin
			result_o = operand_a_i >> operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b100111: begin
			result_o = operand_a_i << operand_b_i;
			comparison_result_o = 1'b0;
		end
		6'b000000: begin
			result_o = $signed(operand_a_i) < $signed(operand_b_i) ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		6'b000001: begin
			result_o = operand_a_i < operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		6'b001010: begin
			result_o = $signed(operand_a_i) >= $signed(operand_b_i) ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		6'b001011: begin
			result_o = operand_a_i >= operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		6'b001100: begin
			result_o = operand_a_i == operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		6'b001101: begin
			result_o = operand_a_i != operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
	endcase

endmodule