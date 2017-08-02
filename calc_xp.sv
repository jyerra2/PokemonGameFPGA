module calc_xp(input logic [7:0] xp_prev,
					input logic [4:0] other_pkmn_id,
					input logic [3:0] other_pkmn_level,
					input logic pkmn_faint,
					output logic [7:0] xp_new,
					output logic level_inc
					);
// 01100 : PikachuBack
// 01101 : DoduoBack
// 01110 : HoundourBack
// 01111 : MurkrowBack

// 10000 : OnyxBack
// 10001 : GolduckBack
// 10010 : PidgeottoBack
// 10011 : SceptileBack

// 10100 : LugiaBack
// 10101 : ArceusBack
// 10110 : ArticunoBack
// 10111 : EnteiBack

               logic [7:0] curr_xp;
					
					always_comb
					begin
		
					if(pkmn_faint)
					begin
					
					if(other_pkmn_id == 5'b01100) //pikachu
					begin
						curr_xp = 25 * other_pkmn_level; // 25*3 = 72
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b01101) //doduo
					begin
						curr_xp = 27 * other_pkmn_level; // 27*3 = 81
						if(curr_xp + xp_prev > 8'd255)
						begin
							xp_new = (curr_xp + xp_prev)%255; 
							level_inc = 1'b1;
						end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b01110) //Houndour
					begin
						curr_xp = 30 * other_pkmn_level; // 30*3 = 90
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b01111) //murkrow
					begin
						curr_xp = 24 * other_pkmn_level; // 24*3 = 72
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10000) //onyx
					begin
						curr_xp = 20 * other_pkmn_level; // 18*8 = 144
						if(curr_xp + xp_prev > 8'd255)
						   begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10001)// golduck
					begin
						curr_xp = 12 * other_pkmn_level; // 12*8 = 96
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10010) //pidgeotto
					begin
						curr_xp = 14 * other_pkmn_level; // 14*8 = 112
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
						   end
					end
					
					else if(other_pkmn_id == 5'b10011) //sceptile
					begin
						curr_xp = 16 * other_pkmn_level;// 16*8 = 128
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10100)// lugia 
					begin
						curr_xp = 14 * other_pkmn_level;//14*13 = 182 
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10101)// arceus
					begin
						curr_xp = 15 * other_pkmn_level;//15*13 = 195
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10110) //articuno
					begin
						curr_xp = 12 * other_pkmn_level;// 12*13 = 156
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else if(other_pkmn_id == 5'b10111) //deoxys
					begin
						curr_xp = 13 * other_pkmn_level; // 13*13 = 169
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
					
					else
					begin
					curr_xp = 10 * other_pkmn_level;// undefined pokemon
						if(curr_xp + xp_prev > 8'd255)
							begin
							xp_new = (curr_xp + xp_prev)%255;
							level_inc = 1'b1;
							end
						else
							begin
							xp_new = curr_xp + xp_prev;
							level_inc = 1'b0;
							end
					end
			end		
					
					
					
					
					
					
				
					else
					curr_xp = xp_prev;
					xp_new = xp_prev;
					level_inc = 1'b0;
					end
					
					endmodule
					