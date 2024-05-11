module test (
	input      [3:0] a,
	input      [3:0] b,
	input		  [3:0] k,
	input		  [3:0] f,
	input      [1:0] s,
	input 		     clk,
	output reg [3:0] c
);

// assign c = (s == 2'b00) ? a : ((s == 2'b01) ? b : ((s == 2'b10) ? k : f ));

always @ (*) begin
	case (s)
		2'b00: c <= a;
		2'b01: c <= b;
		2'b10: c <= k;
		2'b11: c <= f;
	endcase
end

endmodule