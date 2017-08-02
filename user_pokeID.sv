module user_pokeID(input logic [3:0] curr_level,
						 input logic [4:0] curr_ID,
						 output logic [4:0] new_ID);
						 
						 
						 always_comb
						 begin
						 if(curr_ID == 5'b00011 && curr_level > 4'd5)
						 new_ID = 5'b00110;
						 
						 else  if(curr_ID == 5'b00100 && curr_level > 4'd5)
						 new_ID = 5'b00111;
						 
						 else if(curr_ID == 5'b00101 && curr_level > 4'd5)
						 new_ID = 5'b01000;
						 
						 
						 else if(curr_ID == 5'b00110 && curr_level > 4'd11)
						 new_ID = 5'b01001;
						 
						 else  if(curr_ID == 5'b00111 && curr_level > 4'd11)
						 new_ID = 5'b01010;
						 
						 else if(curr_ID == 5'b01000 && curr_level > 4'd11)
						 new_ID = 5'b01011;
						 
						 else
						 new_ID = curr_ID;
						 
						 end
						 endmodule
						 