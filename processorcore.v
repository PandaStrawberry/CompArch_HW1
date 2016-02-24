module processor(
	clk,
	clk_en,
	reset,
	i1,	//MSB Instruction
	i0,	//LSB Instruction,
	c1,	//MSB state
	c0	//LSB state
);
	input i1, i0;
	output c1, c0;
	wire i1, i0, c1, c0, d1, d0;
	assign d0 = ~c1 | c0&(~i1)&i0;
	assign d1 = ~c1 | ~c0 | ~i0 | i1;
	ff ff0 (
		clk,
		clk_en,
		reset,
		d0,
		c0	
	);
	ff ff1 (
		clk,
		clk_en,
		reset,
		d1,
		c1
	);
endmodule	
