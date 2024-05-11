module ALU (
	input      [3:0]  operator_i,
	input      [31:0] operand_a_i,
	input      [31:0] operand_b_i,
	output reg [31:0] result_o,
	output reg        comparison_result_o
);

always @ (*)
	case (operator_i)
		4'd0: begin
			result_o = operand_a_i + operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd1: begin
			result_o = operand_a_i - operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd2: begin
			result_o = operand_a_i ^ operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd3: begin
			result_o = operand_a_i | operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd4: begin
			result_o = operand_a_i & operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd5: begin
			result_o = $signed(operand_a_i) >>> operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd6: begin
			result_o = operand_a_i >> operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd7: begin
			result_o = operand_a_i << operand_b_i;
			comparison_result_o = 1'b0;
		end
		4'd8: begin
			result_o = $signed(operand_a_i) < $signed(operand_b_i) ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		4'd9: begin
			result_o = operand_a_i < operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		4'd10: begin
			result_o = $signed(operand_a_i) >= $signed(operand_b_i) ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		4'd11: begin
			result_o = operand_a_i >= operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		4'd12: begin
			result_o = operand_a_i == operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
		4'd13: begin
			result_o = operand_a_i != operand_b_i ? 1 : 0;
			comparison_result_o = result_o[0];
		end
	endcase

endmodule