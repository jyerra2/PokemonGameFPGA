module hpSubBytes(input clk,
						input logic [7:0] in,
						output logic [5:0] out);
						
						always_ff @ (posedge clk)
						
						
						case(in)
						 
						 default : begin
						 out <= 6'b000111;
						 
						 end
						 
						 8'h00: out <= 6'b111111;
						 
						 8'h35 : out <= 6'b001011;
						 
						 8'h53 : out <= 6'b010111;
						 
						 endcase 
						 
						endmodule
						
						