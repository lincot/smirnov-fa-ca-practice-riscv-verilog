module IM (
	input		  [31:0] A,
	output     [31:0] RD
);

reg [31:0] RAM [0:63];

initial $readmemb("fast-multiplication.txt", RAM);

assign RD = RAM[A[7:2]];

endmodule