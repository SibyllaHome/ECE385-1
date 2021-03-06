module lookahead4(input [3:0]A, B, input c_in, 
							output [3:0] S, output c_out);

reg [4:0] c;
reg [3:0] g, p;
int i;

always_comb
begin
	for (i = 0; i < 4; i = i +1) begin
		g[i] = A[i] & B[i];
		p[i] = A[i] ^ B[i];
	end
	
	c[0] = c_in;
	
	for (i = 1; i < 4; i = i +1) begin
		c[i] = g[i-1] | (p[i-1] & c[i-1]);
	end
end


full_adder FA0(.x(A[0]), .y(B[0]),.z(c[0]), .s(S[0]));
full_adder FA1(.x(A[1]), .y(B[1]),.z(c[1]), .s(S[1]));
full_adder FA14(.x(A[2]), .y(B[2]),.z(c[2]), .s(S[2]));
full_adder FA15(.x(A[3]), .y(B[3]),.z(c[3]), .s(S[3]), .c(c[4]));

endmodule
