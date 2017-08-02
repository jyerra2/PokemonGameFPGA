module starterSelect(input logic [1:0] starterSelect,
							input logic [4:0] prev_ID,
							input logic enable,
							output logic [4:0] new_ID); 
							
							always_comb
							begin
							if(enable)
							
							if(starterSelect == 2'b00)
							new_ID = 5'b00011;
							
							else if(starterSelect == 2'b01)
							new_ID = 5'b00100;
							
							else if(starterSelect == 2'b10)
							new_ID = 5'b00101;
							
							else 
							new_ID = prev_ID;
							
							else
							
							new_ID = prev_ID;
							
						   end
							endmodule
							