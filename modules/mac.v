`default_nettype none

module mac (
    input  wire [7:0] in, 
    output wire [31:0] out, 
    input  wire clk,    
    input  wire rst_n, // reset_n - low to reset
	output wire in_ready,
	input  wire in_valid
	);


	// temp
	assign in_ready = 1'b1;


	// running accumulator, operand reg
	reg signed [31:0] acc;
	reg signed [7:0] a;
	reg phase;

	always @(posedge clk) begin
		
		// active lo sync reset
		if (!rst_n) begin
			acc <= 32'sd0;
			a <= 8'sd0;
			phase <= 1'b0;
		end
		
		// main block 
		else begin
			if (in_ready && in_valid) begin
				if (phase) acc <= acc + (a * $signed(in));

				else 
					a <= $signed(in);
				
				phase <= ~phase;
			end
		end
	end

	assign out = acc;
	

endmodule
